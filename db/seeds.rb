require "open-uri"
require 'faker'

Order.destroy_all
Product.destroy_all
User.destroy_all

puts "destroy done!!!"

user1 = User.create(full_name: 'Switchfeet', email: 'switchfeet@teste.com', password: '123456', artist: 'Switchfeet', admin: false, seller: true)
user2 = User.create(full_name: 'All Souls Matter', email: 'allsoulsmatter@teste.com', password: '123456', artist: 'All Souls Matter', admin: false, seller: true)
user3 = User.create(full_name: 'Shake the Dust', email: 'shakethedust@teste.com', password: '123456', artist: 'Shake the Dust', admin: false, seller: true)
user4 = User.create(full_name: 'Coding Bootcamp', email: 'codingbootcamp@teste.com', password: '123456', artist: 'Coding Bootcamp', admin: false, seller: true)

1.times do
  User.create!(full_name: Faker::Name.name,
               email: Faker::Internet.email,
               password: "123456",
               artist: Faker::Artist.name,
               admin: false,
               seller: false)
end
puts "users done!!!"

product_name = ["Tee", "Sweatpants", "Long Sleeve Tee", "Bag", "Sticker Pack",
                "Baseball Cap", "Pin Set", "Bracelet", "Stainless Steel Camp Mug",
                "Poster", "Face Mask", "Hoodie", "CD", "Vinyl", "Live Stream Ticket"]

product_category = ["Clothing", "Ticket", "Accessories", "Media"]

product_description = ["Excellent quality",
                       "With the artist autograph",
                       "Original design"]

product = Product.create!(name: 'Interrobang White Opaque Vinyl', category: 'Media', price: 100, stock: 5,
               description: 'Limited Edition White Opaque Vinyl *Limited stock remaining!',
               user: user1)
file = URI.open('https://source.unsplash.com/aK3kzv5yGwU/300x300')
product.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


product2 = Product.create(name: 'Presence Shirt', category: 'Clothing', price: 40, stock: 20,
               description: 'You are not here for the sake of a perfect existence. The magic of your soul is not
               contingent upon flawlessness. Today and always, we need your presence, not your perfection.',
file = URI.open('shirt - https://source.unsplash.com/TT-ROxWj9nA/300x300')
product2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

product3 = Product.create(name: 'Pin Sets', category: 'Accessories', price: 30, stock: 10,
               description: 'Collect all 4 enamel pins in one set!',
file = URI.open('https://source.unsplash.com/etcp7sNcFiU/300x300')
product3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

product4 = Product.create(name: 'November 30th Livestream Ticket', category: 'Ticket', price: 50, stock: 100,
               description: 'All live stream details will be emailed as soon as they are set!',
file = URI.open('https://source.unsplash.com/TE50158gdvs/300x300')
product4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# 1.times do
#   Product.create!(name: product_name.sample,
#                   category: product_category.sample,
#                   description: product_description.sample,
#                   price: rand(20..150),
#                   stock: rand(5..10),
#                   user_id: User.all.sample.id,
#                   img_url: "https://res.cloudinary.com/doytrcpmk/image/upload/v1635437117/ignat-kushanrev-y9DEa0AqluQ-unsplash_qf23cp.jpg")
# end

puts "products done!!!"

User.create(full_name: 'Luanda', email: 'luanda@admin.com', password: '123456', admin: true, seller: false)
User.create(full_name: 'Eugenia', email: 'eugenia@admin.com', password: '123456', admin: true, seller: false)
User.create(full_name: 'Wilson', email: 'eugenia@admin.com', password: '123456', admin: true, seller: false)
puts "admins: Eugenia, Luanda e Wilson - done!!!"

User.create(full_name: 'Luanda', email: 'luanda@teste.com', password: '123456', artist: 'Luanda band', admin: false, seller: false)
User.create(full_name: 'Eugenia', email: 'eugenia@teste.com', password: '123456', artist: 'Eugenia band', admin: false, seller: false)
User.create(full_name: 'Wilson', email: 'wilson@teste.com', password: '123456', artist: 'Wilson band', admin: false, seller: false)
puts "common profiles: Eugenia, Luanda e Wilson - done!!!"

puts "All seeds completed succesfully!!!"
