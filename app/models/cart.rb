class Cart < ActiveRecord::Base
	has_many :lineitems
	has_one :order

	def total_price
		lineitems.to_a.sum{|item| item.total_price}
		# lineitems.to_a.sum(&:total_price)
	end

	def total_items
		lineitems.sum(:quantity)
	end

	def add_product(current_cart,product_id, product_price)
		current_item = lineitems.where(:product_id => product_id).first
		if current_item
			current_item.quantity += 1
		else
			current_item = Lineitem.new(:cart => current_cart, :product_id => product_id, :quantity => 1, :unit_price => product_price)
			lineitems << current_item
		end
		current_item
	end
end
