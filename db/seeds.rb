# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 50.times do
#   product1 = Product.new({name: Faker::Commerce.product_name, price: Faker::Commerce.price, image: Faker::Avatar.image, description: Faker::Commerce.color})
#   product1.save
# end


products = Product.all

products.each do |product|
  3.times do
    image1 = Image.new(url: Faker::Avatar.image, product: product).save!
  end
end

# 100.times do
#   image1 = Image.new(url: Faker::Avatar.image)
#   image1.save!
# end
