namespace :db do
	desc "Erase and fill database"
	task populate: :environment do
		Rake::Task['db:reset'].invoke
		require 'populator'
		require 'faker'
		make_category
		make_product
	end
end

	def make_category
		['Electronics','Office Supllies','Toys','Clothing','Groceries','Furniture'].each do |category|
			Category.create!(name:  category)
		end
	end

	def make_product
		20.times do|n|
			product = Populator.words(1..5).titleize
			price = [4.99, 9.99, 14.99, 19.99, 29.99, 34.99]
			p = Product.create!(name: product, price: price.sample)

			categories = Category.all
			3.times do |n|
				Categorization.create!(product_id: p.id, category_id: categories.sample.id)
			end
		end
	end