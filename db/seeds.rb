# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "destroying previous seeds 🗑️"
Star.destroy_all
User.destroy_all
Booking.destroy_all
Review.destroy_all
puts "destroyed seeds"
user = User.create!(email: "usmanv5@hotmail.com", password: "password", first_name: "usman" , last_name: "ali", address: "pluto", user_description: "hello world")
star = Star.create!(user: user, name: "bob", description: "epic star", registration_number: 420, price: 420.420, availability: true, location: "in narnia")
booking = Booking.create!(user: user, star: star, booking_status: true, comment: 'hello world this is my comment', start_date: Time.now, end_date: Time.new(2023,12,12))
Review.create!(comment: "hahaaaaaaaaaaaaaaaaaaaa im dumbs", rating: 3, booking: booking)
