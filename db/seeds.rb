require 'pexels'
require 'faker'

client = Pexels::Client.new('563492ad6f91700001000001b37bb4d32a1b4592a6e752017bf29a6f')
profile_pic_url = []

puts "Début de la seed"
puts "Destruction des modèles"
Room.destroy_all
Hotel.destroy_all
Booking.destroy_all
User.destroy_all

puts "création de 2 users"
client.photos.search('face', orientation: 'square', per_page: 10).each do |photo|
  profile_pic_url << photo.src["small"]
end
user_1 = User.create(password: "123456", email: "fabrizio@gmail.com", first_name: "Fabrizio", last_name: "Durano", image_url: profile_pic_url.sample)
user_2 = User.create(password: "123456", email: "celine@gmail.com", first_name: "Celine", last_name: "Toto", image_url: profile_pic_url.sample)

puts "création de 10 hôtels"
  Hotel.create!(
    name: "Hotel San Régis",
    address: "Rue Jean Goujon, Paris",
    rating: rand(3.0..5.0).round(2)
  )

  Hotel.create!(
    name: "Hotel Marriott",
    address: "Champs-Elysées, Paris",
    rating: rand(3.0..5.0).round(2)
  )

  Hotel.create!(
    name: "Paris Davout",
    address: "Bd Davout, Paris",
    rating: rand(3.0..5.0).round(2)
  )

  Hotel.create!(
    name: "Hotel Lutetia",
    address: "Bd Raspail, Paris",
    rating: rand(3.0..5.0).round(2)
  )

  Hotel.create!(
    name: "Clos Saint-Martin",
    address: "Pl Saint-Martin, Caen",
    rating: rand(3.0..5.0).round(2)
  )

  Hotel.create!(
    name: "Hotel La Maison",
    address: "Rue Huguerie, Bordeaux",
    rating: rand(3.0..5.0).round(2)
  )

  Hotel.create!(
    name: "Hotel Vieux Lille",
    address: "Rue Royale, Lille",
    rating: rand(3.0..5.0).round(2)
  )

  Hotel.create!(
    name: "La tour du Capitole",
    address: "Rue Chalande, Toulouse",
    rating: rand(3.0..5.0).round(2)
  )

  Hotel.create!(
    name: "Hotel La Mirande",
    address: "PL L'Amirande, Avignon",
    rating: rand(3.0..5.0).round(2)
  )

  Hotel.create!(
    name: "Hotel des Terreaux",
    address: "Rue Lanterne, Lyon",
    rating: rand(3.0..5.0).round(2)
  )

puts "création de 15 chambres d'hôtel"
client.photos.search('Hotel room', per_page: 15).each do |photo|
  Room.create!(
    price_per_night: rand(35..500),
    capacity: rand(1..5),
    image_url: photo.src["landscape"],
    hotel_id: Hotel.all.sample.id
  )
end
puts "seed terminée"
