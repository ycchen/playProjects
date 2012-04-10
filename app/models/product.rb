class Product < ActiveRecord::Base
	has_many :categorizations
	has_many :categories, through: :categorizations
	has_many :comments

	validates :name, :presence => true
	validates :price, :presence => true, :numericality => true
end
