require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

25.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  rank = "White"
  size = 4

  Student.create(firstName: first_name, lastName: last_name, rank: rank, size: size)
end
