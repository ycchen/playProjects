class Lineitem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	def full_price
		unit_price * quantity
	end
end
