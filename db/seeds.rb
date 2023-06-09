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
# db/seeds.rb
Profile.destroy_all
User.destroy_all

require 'faker'
# Generate ten random usersù
for i in (1..6).to_a do
  User.create!(
    email: "user#{i}@gmail.com",
    password: "123456"
  )
end

puts "Users created"
# end

User.all.each do |user|
  Profile.create(user: user, boyfriendname: Faker::App.name.downcase, age: rand(18...40), location: "85435 Erding", description: Faker::Lorem.paragraph, gender: ["male", "female"].sample)
end
