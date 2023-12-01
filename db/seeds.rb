require "faker"

puts "destroying previous seeds 🗑️"
Star.destroy_all
User.destroy_all
Booking.destroy_all
Review.destroy_all

puts "Creating admin user 🥷 | email: admin@gmail.com | password: password"

user = User.new(
  email: "admin@gmail.com",
  password: "password",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: Faker::Address.full_address,
  user_description: Faker::Quote.famous_last_words
)

user.photo.attach(
  io: URI.open(Faker::Avatar.image),
  filename: "#{user.first_name}.png",
  content_type: "image/png"
)
user.save

puts "creating dummy users 🤷‍♂️"

20.times do
  dummy_user = User.new(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    user_description: Faker::Quote.famous_last_words
  )

  dummy_user.photo.attach(
    io: URI.open(Faker::Avatar.image),
    filename: "#{user.first_name}.png",
    content_type: "image/png"
  )
  dummy_user.save
end

puts "creating dummy stars ⭐️"

20.times do
  star = Star.new(
    user_id: User.last.id,
    name: Faker::Space.star,
    description: Faker::Space.agency,
    registration_number: 123456,
    price: Faker::Number.decimal(l_digits: 2),
    availability: true,
    location: Faker::Space.star_cluster
  )

  star.photo.attach(
    io: URI.open("https://source.unsplash.com/random?stars/#{[Faker::Number.within(range: 1..50)]}"),
    filename: "#{star.name}.png",
    content_type: "image/png"
  )
  star.save!
end

puts "creating dummy bookings 📆"

20.times do
  Booking.create(
    user_id: User.all.sample.id,
    star_id: Star.all.sample.id,
    booking_status: true,
    comment: Faker::Quote.famous_last_words,
    start_date: Time.now,
    end_date: Time.new(2023, 12, 12)
  )
end
puts "creating dummy reviews 💬"

20.times do
  Review.create(
    comment: Faker::Quote.famous_last_words,
    rating: Faker::Number.within(range: 1..5),
    booking: Booking.all.sample
  )
end

puts "finished 🚀"
