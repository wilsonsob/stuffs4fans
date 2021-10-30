# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Order.destroy_all
Product.destroy_all
User.destroy_all

puts "destroy done!!!"

5.times do
  user = User.create!(full_name: Faker::Name.name,
                      email: Faker::Internet.email,
                      password: "123456",
                      artist: Faker::Artist.name,
                      admin: false)
end
puts "users done!!!"

5.times do
  Product.create!(name: Faker::Commerce.product_name,
                  category: Faker::Music.instrument,
                  description: Faker::Lorem.paragraph(sentence_count: 2),
                  price: rand(20..150),
                  stock: rand(5..10),
                  user_id: User.all.sample.id)
  end

puts "products done!!!"

User.create(full_name: 'Luanda', email: 'luanda@admin.com', password: '123456', admin: true)
User.create(full_name: 'Eugenia', email: 'eugenia@admin.com', password: '123456', admin: true)
User.create(full_name: 'Wilson', email: 'eugenia@admin.com', password: '123456', admin: true)
puts "admins: Eugenia, Luanda e Wilson - done!!!"

User.create(full_name: 'Luanda', email: 'luanda@teste.com', password: '123456', artist: 'Luanda band', admin: false)
User.create(full_name: 'Eugenia', email: 'eugenia@teste.com', password: '123456', artist: 'Eugenia band', admin: false)
User.create(full_name: 'Wilson', email: 'wilson@teste.com', password: '123456', artist: 'Wilson band', admin: false)
puts "common profiles: Eugenia, Luanda e Wilson - done!!!"

puts "All seeds completed succesfully!!!"
