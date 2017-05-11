# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Category.create!(name: "Books")
Category.create!(name: "Clothing")
Category.create!(name: "Outdoors")
Category.create!(name: "Electronics")
Category.create!(name: "Sports")
Category.create!(name: "Movies")
Category.create!(name: "Household Supplies")
Category.create!(name: "Cosmetics")
Category.create!(name: "Food")

User.create(username: "gbrar", email: 'gbrar@example.com', password: 'nanunanu')

Item.create(name: "Dr. No", description: "James Bond", price: 5, seller_id: 1, unit: "Bond Collection", count: 8)
Item.create(name: "Goldfinger", description: "James Bond", price: 5, seller_id: 1, unit: "Bond Collection", count: 8)
Item.create(name: "World is Not Enough", description: "James Bond", price: 5, seller_id: 1, unit: "Bond Collection", count: 8)
Item.create(name: "Man With the Golden Gun", description: "James Bond", price: 5, seller_id: 1, unit: "Bond Collection", count: 8)
Item.create(name: "Moonraker", description: "James Bond", price: 5, seller_id: 1, unit: "Bond Collection", count: 8)
Item.create(name: "Diamonds are Forever", description: "James Bond", price: 5, seller_id: 1, unit: "Bond Collection", count: 8)
Item.create(name: "Spectre", description: "James Bond", price: 5, seller_id: 1, unit: "Bond Collection", count: 8)
