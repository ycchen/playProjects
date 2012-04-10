class Product < ActiveRecord::Base
	has_many :categorizations
	has_many :categories, through: :categorizations
	has_many :comments
end
