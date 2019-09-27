require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ email: 'test1@gmail.com', password: 'passowrd'}, { email: 'test2@gmail.com', password: 'password'}])

25.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  rank = "White"
  size = 4
  user_id = User.first.id

  Student.create(firstName: first_name, lastName: last_name, rank: rank, size: size, user_id: user_id)
end
