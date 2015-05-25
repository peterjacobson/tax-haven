FactoryGirl.define do
  factory :product do
    name Faker::Commerce.product_name
		story Faker::Lorem.paragraph
		cost Faker::Commerce.price
		image_url Faker::Avatar.image
  end

end
