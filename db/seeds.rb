require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ email: 'test1@gmail.com', password: 'password'}, { email: 'test2@gmail.com', password: 'password'}])

Constants::Ranks.each_with_index do |rank, index|
  AvailableRank.create(name: rank, order: index + 1, rankType: "standard")
end

1.times do
  status = true
  location = "Boise"
  date = Faker::Date.forward(days: 14) 
  user_id = User.first.id

  Testing.create(status: status, location: location, date: date, user_id: user_id)
end

70.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  size = Constants::AvailableSizes.sample
  user_id = User.first.id
  rank = AvailableRank.order("RANDOM()").first

  Student.create(firstName: first_name, lastName: last_name, size: size, user_id: user_id)
    .ranks.create!(name: rank.name, order: rank.order, rankType: rank.rankType)
end
