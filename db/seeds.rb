require 'faker'

10.times { Product.create(
	name: Faker::Commerce.product_name, 
	story: Faker::Lorem.paragraph,
	cost: Faker::Commerce.price,
	image_url: Faker::Avatar.image
)}
