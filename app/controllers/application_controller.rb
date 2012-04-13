class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin?


  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found

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
