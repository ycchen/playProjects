class Order < ActiveRecord::Base
	belongs_to :cart
  attr_accessible :cart_id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on
end
