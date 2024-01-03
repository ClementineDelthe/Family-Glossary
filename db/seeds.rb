# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating Clem"
clem = User.create(name: "Clem", email: "clementine@gmail.com", password: "azerty")
puts "Clem created"

puts "Creating Margue"
margue = User.create(name: "Margue", email: "marguerite@gmail.com", password: "azerty")
puts "Margue created"
