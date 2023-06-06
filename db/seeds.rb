# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Helper method to generate random data
# db/seeds.rb

require 'faker'

# Generate ten random users
#5.times do
  user = User.create!(
    email: "email@gmail.com",
    password: "password",
    name: "GeneralUser",
    age: rand(18..65),
    description: Faker::Lorem.sentence,
    gender: ['Male', 'Female', 'Other'].sample,
    location: Faker::Address.city,
    interest: Faker::Lorem.paragraph
  )
  puts "Created user with email: #{user.email}"


# end
