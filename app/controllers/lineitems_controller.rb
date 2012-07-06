class LineitemsController < ApplicationController
  def new
  end

  def create
  	@cart = current_cart
  	@product = Product.find(params[:product_id])
  	@lineitem = Lineitem.create!(:cart => current_cart, :product => @product, :quantity => 1, :unit_price => @product.price)
  	# @lineitem = Lineitem.create!(cart: current_cart, product: @product, quantity: 1, unit_price: @product.price)
  	#@lineitem = @cart.add_product(current_cart,@product.id, @product.price)

  	flash[:notice] = "Added #{@product.name} to cart."
  	redirect_to	current_cart_url
  	# render params.inspect + ' <br/>' + @product.inspect + '<br/>'+ @cart.inspect
  	#render @gallery.inspect
  end
end
