class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin?


  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found

  private
    # def current_cart
    #   if session[:cart_id]
    #     @current_cart ||= Cart.find(session[:cart_id])
    #     session[:cart_id] = nil if @current_cart.purchased_at
    #   end

    #   if session[:cart_id].nil?
    #     @current_cart = Cart.create!
    #     session[:cart_id] = @current_cart.id
    #   end
    #   @current_cart
    # end


    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

  protected

  def rescue_not_found
    render :file => "#{Rails.root.join}/public/404_new.html", :status => :not_found
  end

  def authorize
  	unless admin?
  		flash[:error] = "unauthorized access"
  		redirect_to root_path
  		false
  	end
  end

  def admin?
  	session[:password] == "foobar"
  end

end
