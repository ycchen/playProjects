class Product < ActiveRecord::Base
	has_many :categorizations
	has_many :categories, through: :categorizations
	has_many :comments

	attr_accessor :new_category_name
	before_save :create_category_from_name

	validates :name, :presence => true
	validates :price, :presence => true, :numericality => true

	def create_category_from_name
		create_category(:name => new_category_name) unless new_category_name.blank?
	end

	def to_param
		"#{id}-#{name.parameterize}"
	end
end
