# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
Booking.destroy_all
Car.destroy_all
puts 'Creating data...'

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::FunnyName.name
  )
  car = Car.create!(
    name: Faker::Restaurant.name,
    model: 'SUV',
    description: 'This is a good one',
    user: user
  )
  booking = Booking.create!(
    start_date: Date.today,
    end_date: Date.tomorrow,
    car: car,
    user: user
  )
  puts "Created booking with id #{booking.id}"
end
