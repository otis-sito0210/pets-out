require "faker"

# # puts "Destroy cities and places"
# # City.destroy_all
# # Place.destroy_all
# Activity.destroy_all

# print "Creating cities"


# 2.times do
#   City.create(
#     local: Faker::Address.city
#   )
# end


# puts "Creating places"

# 2.times do
#   place = Place.new(
#     user_id: 1,
#     city_id: rand(11..50),
#     title: Faker::Lorem.words(number: 3).join(' '),
#     subtitle: Faker::Lorem.sentence,
#     address: Faker::Address.full_address,
#     pricing: Faker::Commerce.price,
#     rooms: rand(1..5),
#     details: Faker::Lorem.paragraph,
#   )
#   place.save!
# end

# puts "Creating pets!"

# 10.times do
#   Pet.create(
#     name: Faker::Creature::Dog.name,
#     age: rand(1..15),
#     size: ['Small', 'Medium', 'Large'].sample,
#     breed: Faker::Creature::Dog.breed,
#     details: Faker::Lorem.sentence,
#     user_id: 1
#   )
# end

# puts "Creating activities"





10.times do
  activity = Activity.new(
    user_id: 1,
    details: Faker::Lorem.paragraph,
    city_id: 11,
    title: Faker::Lorem.words(number: 3).join(' '),
    subtitle: Faker::Lorem.sentence,
    address: Faker::Address.full_address
  )
  activity.save!
end

puts "Done!"
