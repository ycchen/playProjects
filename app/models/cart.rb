class Cart < ActiveRecord::Base
	has_many :lineitems
	has_one :order
end
