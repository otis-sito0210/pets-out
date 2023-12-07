require "open-uri"

puts "Destroying evertything"
Appointment.destroy_all
Activity.destroy_all
Trip.destroy_all
Place.destroy_all
City.destroy_all
Pet.destroy_all
User.destroy_all

##################################################
puts "Creating Users"

user1 = User.create!(
  email: "otavio@gmail.com",
  nickname: "otavio",
  password: "123123",
  password_confirmation: "123123"
)

user2 = User.create!(
  email: "igor@gmail.com",
  nickname: "igor",
  password: "123123",
  password_confirmation: "123123"
)

user3 = User.create!(
  email: "moises@gmail.com",
  nickname: "moises",
  password: "123123",
  password_confirmation: "123123"
)

user4 = User.create!(
  email: "chloe@gmail.com",
  nickname: "chloe",
  password: "123123",
  password_confirmation: "123123"
)

##################################################
puts "Creating Pets"

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1697799193/production/swwrrqwpxaimj5jqmw9yzhshwd2t.jpg")
pet1 = Pet.new(
  user: user1,
  name: "Page",
  age: 9,
  size: "Medium",
  breed: "Whippet",
  details: "A shy, loving dog that loves to play with people, and eat sticks on parks."
  )
pet1.photo.attach(io: file, filename: "#{pet1.name}.png", content_type: "image/png")
pet1.save!

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1699108428/production/sc7lnmuzjsrqhd55susft20ohx9j.jpg")
pet2 = Pet.new(
  user: user1,
  name: "Queenie",
  age: 12,
  size: "Big",
  breed: "Borzoi",
  details: "The furriest and loveliest dog, recently gave birth to Prince. She just loves to stare at people, laying on the floor"
  )
pet2.photo.attach(io: file, filename: "#{pet2.name}.png", content_type: "image/png")
pet2.save!

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1699123976/production/7g6isk0wj0z45i5a4ec02y83w0eq.jpg")
pet3 = Pet.new(
  user: user2,
  name: "Sansa",
  age: 10,
  size: "Small",
  breed: "Cat",
  details: "A lazy, chill out cat that likes to play with dogs, inside or outside."
  )
pet3.photo.attach(io: file, filename: "#{pet3.name}.png", content_type: "image/png")
pet3.save!

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1698527384/production/k4cittf00nyw94mbj7vhy8lh052l.webp")
pet4 = Pet.new(
  user: user2,
  name: "Don",
  age: 5,
  size: "Small",
  breed: "Stray dog",
  details: "A playful dog, that interacts with everyone and every pet, big or small. What he really loves is a belly rub."
  )
pet4.photo.attach(io: file, filename: "#{pet4.name}.png", content_type: "image/png")
pet4.save!

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1699108325/production/amljy8y0k3i07fc83yfa2wj771vs.jpg")
pet5 = Pet.new(
  user: user3,
  name: "Dobly",
  age: 5,
  size: "Small",
  breed: "Italian Greyhound",
  details: "Like Harry Potter's character, Dobly is small, affectuous, but pretty strange"
  )
pet5.photo.attach(io: file, filename: "#{pet5.name}.png", content_type: "image/png")
pet5.save

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701990729/Lily_wg9ykv.jpg")
pet6 = Pet.new(
  user: user3,
  name: "Lily",
  age: 5,
  size: "Small",
  breed: "Yorkshire Terrier",
  details: "A playful dog, that interacts with everyone and every pet, big or small. What he really loves is a belly rub."
  )
pet6.photo.attach(io: file, filename: "#{pet6.name}.png", content_type: "image/png")
pet6.save!

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1699108047/production/44it9vbb0efn04zjcvb7asuduk5b.jpg")
pet7 = Pet.new(
  user: user4,
  name: "Filó",
  age: 8,
  size: "Big",
  breed: "Golden Retriever",
  details: "A life long companion for me, and that loves some rough play with dogs. She gets very excited running, so small dogs should be careful!"
  )
pet7.photo.attach(io: file, filename: "#{pet7.name}.png", content_type: "image/png")
pet7.save!

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701384779/development/irlcd2v8nd4nzcnqt7i8xxtkslwc.jpg")
pet8 = Pet.new(
  user: user4,
  name: "Dexter",
  age: 8,
  size: "Big",
  breed: "Pit Bull",
  details: "Protector of our homes and hearts, it's a big dog that actually loves people, and have more shy interactions with other dogs, like to keep it to herself."
  )
pet8.photo.attach(io: file, filename: "#{pet8.name}.png", content_type: "image/png")
pet8.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701545745/perna-longa_qjgod4.jpg")
pet9 = Pet.new(
 user: user3,
 name: "Perna Longa",
 age: 5,
 size: "Big",
 breed: "Dashund",
 details: "His joy is infectious, loves playtime, and is ever-ready to shower affection. A loyal companion and a true friend, he brightens days with his charming and loving personality."
 )
pet9.photo.attach(io: file, filename: "#{pet9.name}.png", content_type: "image/png")
pet9.save!


##################################################
puts "Creating Cities"

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701367832/development/wskvjsvyide8aivx5vn3kt35evpo.jpg")
city1 = City.new(local: "Manaus")
city1.photo.attach(io: file, filename: "#{city1.local}.png", content_type: "image/png")
city1.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1700924288/production/wc3wy5mxr2hpdol13leoth83srqw.jpg")
city2 = City.new(local: "Belém")
city2.photo.attach(io: file, filename: "#{city2.local}.png", content_type: "image/png")
city2.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1700939179/production/0x89u5rk48rx4wrnxi8kucw6ggeg.jpg")
city3 = City.new(local: "Campo Grande")
city3.photo.attach(io: file, filename: "#{city3.local}.png", content_type: "image/png")
city3.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1700939241/production/o2k4y49bahzphugg4k8076fsddfx.jpg")
city4 = City.new(local: "Cuiabá")
city4.photo.attach(io: file, filename: "#{city4.local}.png", content_type: "image/png")
city4.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1700939125/production/t1tcgpxmuk4ywets5pfqy0c4ub9j.jpg")
city5 = City.new(local: "Fortaleza")
city5.photo.attach(io: file, filename: "#{city5.local}.png", content_type: "image/png")
city5.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1700940191/production/s44lekjgopmx57elsv8dxz9ic7lc.jpg")
city6 = City.new(local: "Rio de Janeiro")
city6.photo.attach(io: file, filename: "#{city6.local}.png", content_type: "image/png")
city6.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1700940261/production/hb8d2ls9uskbh3cc9yehx6zp5xus.jpg")
city7 = City.new(local: "São Paulo")
city7.photo.attach(io: file, filename: "#{city7.local}.png", content_type: "image/png")
city7.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1700939703/production/bugqvtotccev569o4rwtkqlvyown.jpg")
city8 = City.new(local: "São Luis do Maranhão")
city8.photo.attach(io: file, filename: "#{city8.local}.png", content_type: "image/png")
city8.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1700939306/production/rhek8mtacdf4n0iime37gdkk8lm6.jpg")
city9 = City.new(local: "Palmas")
city9.photo.attach(io: file, filename: "#{city9.local}.png", content_type: "image/png")
city9.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701211492/production/38l1zuhkfc69iuf3xfi19w5dapme.jpg")
city10 = City.new(local: "Boa Vista")
city10.photo.attach(io: file, filename: "#{city10.local}.png", content_type: "image/png")
city10.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1700939444/production/waxkfqzs9yhgdvt2vu8u9jv5flvv.jpg")
city11 = City.new(local: "Rio Branco")
city11.photo.attach(io: file, filename: "#{city11.local}.png", content_type: "image/png")
city11.save!

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1700939343/production/9dojt58zpavx0ru1ss4f7guhyyge.jpg")
city12 = City.new(local: "Porto Velho")
city12.photo.attach(io: file, filename: "#{city12.local}.png", content_type: "image/png")
city12.save!


##################################################
puts "Creating Places in Boa Vista - city = 10"

file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701538513/casaEmBoaVista_vnj4iy.jpg")
place1 = Place.new(
  city: city10,
  user: user1,
  title: "Cozy House in the Mountain",
  subtitle: "Epequem Mountain Range",
  address:  "RR-321, Boa Vista, Brasil",
  pricing: "180",
  rooms: "4",
  details: "Pousada & Natureza offers accommodations with an outdoor pool, free private parking, and a garden.",
  )
place1.photo.attach(io: file, filename: "#{place1.title}.png", content_type: "image/png")
place1.save!


file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701540834/AipanaPlaza_jl7rxe.jpg")
place2 = Place.new(
 city: city10,
 user: user1,
 title: "Amidst Nature's Embrace",
 subtitle: "Vacation Home",
 address:  "Praça do Centro Cívico, Centro, Boa Vista",
 pricing: "280",
 rooms: "4",
 details: "Pousada & Natureza provides lodgings featuring an outdoor pool, complimentary private parking, and a lush garden. Enjoy a relaxing stay surrounded by natural beauty and the tranquility of the surroundings. Immerse yourself in the comfort of our accommodations, take a refreshing dip in the outdoor pool, and appreciate the convenience of free private parking. The inviting garden adds a touch of serenity, creating a perfect retreat for nature lovers and those seeking a peaceful escape.",
 )
place2.photo.attach(io: file, filename: "#{place2.title}.png", content_type: "image/png")
place2.save!


file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701541367/mans%C3%A3o_zixizd.jpg")
place3 = Place.new(
  city: city10,
  user: user1,
 title: "Surrounded by Nature's Beauty",
 subtitle: "Comfortable Residence ",
 address:  "Praça do Centro Cívico, Centro, Boa Vista",
 pricing: "280",
 rooms: "4",
 details: "Indulge in the ultimate getaway at Pousada & Natureza, where our lodgings feature an inviting outdoor pool, complimentary private parking, and a lush garden. Immerse yourself in the serenity of natural beauty as you enjoy a relaxing stay. With comfortable accommodations, a refreshing pool for a dip, and the convenience of free parking, our retreat is perfect for nature enthusiasts and those seeking a tranquil escape.",
 )
place3.photo.attach(io: file, filename: "#{place3.title}.png", content_type: "image/png")
place3.save


##################################################
puts "Creating Places in São Paulo - city = 7"

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701538104/casa_1_sa%CC%83o_paulo_noqekp.webp")
place4 = Place.new(
  city: city7,
  user: user1,
  title: "Beautiful House",
  subtitle: "House in Vila Madalena, Brazil",
  address:  "Rua Afonso José de Carvalho, 149 - São Paulo,SP - Brasil ",
  pricing: "800",
  rooms: "6",
  details: "Relax in this calm and stylish space. A modern house with clean decoration.
  Come experience the life of a São Paulo resident in this super cozy and well-located home!
  For events and rentals for photos and films, inquire about values and conditions different from those practiced for guests",
  )
place4.photo.attach(io: file, filename: "#{place4.title}.png", content_type: "image/png")
place4.save!


file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701538432/casa_2_fdxvcr.webp")
place5 = Place.new(
  city: city7,
  user: user1,
  title: "In the heart of Itaim-Bibi",
  subtitle: "Entire space",
  address: "Rua Afonso José de Carvalho, 149 - São Paulo, SP - Brazil",
  pricing: "800",
  rooms: "6",
  details: "Forget your worries in this great place - it's an oasis of tranquility!",
)
place5.photo.attach(io: file, filename: "#{place5.title}.png", content_type: "image/png")
place5.save!


file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701538777/casa_3_twou7f.webp")
place6 = Place.new(
  city: city7,
  user: user1,
  title: "Downtown Residence",
  subtitle: "Day and night adventures",
  address: "Avenida Presidente Juscelino kubitschek, 1909 - São Paulo, SP - Brazil",
  pricing: "800",
  rooms: "6",
  details: "Forget your worries in this great place - it's an oasis of tranquility!",
)
place6.photo.attach(io: file, filename: "#{place6.title}.png", content_type: "image/png")
place6.save!


file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701538861/casa-4_lyachb.webp")
place7 = Place.new(
  city: city7,
  user: user1,
  title: "Gather your friends",
  subtitle: "Place with many facilities to your pet party!",
  address: "Rua Corinto, 543 - São Paulo, SP - Brazil",
  pricing: "1200",
  rooms: "6",
  details: "Entertain humans and pets in this beautiful place.",
)
place7.photo.attach(io: file, filename: "#{place7.title}.png", content_type: "image/png")
place7.save!


file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701539147/casa_5_kktios.webp")
place8 = Place.new(
  city: city7,
  user: user1,
  title: "Beautiful Townhouse",
  subtitle: "Old-century house for your fancy party with pets",
  address: "Rua  Áustria, 278 - São Paulo, SP - Brazil",
  pricing: "800",
  rooms: "6",
  details: "Just go classic vibe in this amazing place",
)
place8.photo.attach(io: file, filename: "#{place8.title}.png", content_type: "image/png")
place8.save!


file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701819825/casa_6_fkehix.jpg")
place9 = Place.new(
  city: city7,
  user: user1,
  title: "Beautiful Big Home",
  subtitle: "Old-century house for your fancy party with pets",
  address: "Rua Teodoro Sampaio, 1933 - - São Paulo, SP - Brazil",
  pricing: "800",
  rooms: "6",
  details: "Just go classic vibe in this amazing place",
)
place9.photo.attach(io: file, filename: "#{place9.title}.png", content_type: "image/png")
place9.save!



file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701819867/casa_9_v9gyno.jpg")
place10 = Place.new(
  city: city7,
  user: user1,
  title: "Pet-Friendly Paradise",
  subtitle: "A haven for your furry friends to roam freely",
  address: "Rua Itabi, 172 - - São Paulo, SP - Brazil",
  pricing: "900",
  rooms: "4",
  details: "Escape to a pet paradise with spacious rooms and play areas.",
)
place10.photo.attach(io: file, filename: "#{place10.title}.png", content_type: "image/png")
place10.save!

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701819868/casa_7_jdf1r2.jpg")
place11 = Place.new(
  city: city7,
  user: user1,
  title: "Urban Jungle Retreat",
  subtitle: "Experience nature in the heart of the city",
  address: "Avenida Greenery, 456 - São Paulo, SP - Brazil",
  pricing: "1000",
  rooms: "5",
  details: "Surround yourself with lush greenery and modern amenities.",
)
place11.photo.attach(io: file, filename: "#{place11.title}.png", content_type: "image/png")
place11.save!


file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701819868/casa_8_jw31ec.jpg")
place12 = Place.new(
  city: city7,
  user: user1,
  title: "Artistic Haven for Pet Lovers",
  subtitle: "Immerse yourself in creativity with your furry friends",
  address: "Rua Artista, 789 - São Paulo, SP - Brazil",
  pricing: "1200",
  rooms: "3",
  details: "An artsy space designed for both pets and their creative owners.",
)
place12.photo.attach(io: file, filename: "#{place12.title}.png", content_type: "image/png")
place12.save!

##################################################
puts "Creating Activities in Boa Vista"


file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701543639/Teatro_hkgr3k.jpg")
activity1 = Activity.new(
 city: city10,
 user: user1,
 title: "Municipal theater",
 subtitle: "Cultural night with your pet",
 address: "Av. Glaycon de Paiva - São Vicente, Boa Vista",
 details: "An enchanting evening of culture and pets. Live performances, pet zones, treats, and a photo booth.",
 response: nil,
)
activity1.photo.attach(io: file, filename: "#{activity1.title}.png", content_type: "image/png")
activity1.save!


file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701818958/portalDoMilenio_m1nz0i.jpg")
activity11 = Activity.new(
 city: city10,
 user: user1,
 title: "Millennium Portal",
 subtitle: "Millennium Portal with your Pet",
 address: "Av. Cap. Ene Garcês - Centro, Boa Vista - RR",
 details: "Visit the Millennium Portal and discover the fascinating story behind this portal.",
 response: nil,
)
activity11.photo.attach(io: file, filename: "#{activity11.title}.png", content_type: "image/png")
activity11.save!


file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701819454/selvinha_gynuem.jpg")
activity12 = Activity.new(
 city: city10,
 user: user1,
 title: "Amazon jungle",
 subtitle: "Amazon jungle your pet",
 address: "R. Castelo Branco, 236 - São Vicente, Boa Vista - RR",
 details: "A spacious place with many attractions, ideal for your pet to have fun.",
 response: nil,
)
activity12.photo.attach(io: file, filename: "#{activity12.title}.png", content_type: "image/png")
activity12.save!


file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701819993/parqueAnau%C3%A1_mtzlh9.jpg")
activity13 = Activity.new(
 city: city10,
 user: user1,
 title: "Anaua Park",
 subtitle: "Cultural night with your pet",
 address: "Av. Brg. Eduardo Gomes, 2207-2109 - Dos Estados, Boa Vista - RR",
 details: "A natural and cultural environment for you and your pet.",
 response: nil,
)
activity13.photo.attach(io: file, filename: "#{activity13.title}.png", content_type: "image/png")
activity13.save!


file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701820682/parqueDospapagaios_b2qmso.webp")
activity13 = Activity.new(
 city: city10,
 user: user1,
 title: "Bosque dos Papagaios",
 subtitle: "Bosque dos Papagaios Ecological Park",
 address: "R. Moisés de Souza Cruz - Paraviana, Boa Vista - RR",
 details: "Perfect place for you and yours to connect with nature.",
 response: nil,
)
activity13.photo.attach(io: file, filename: "#{activity13.title}.png", content_type: "image/png")
activity13.save!


file = URI.open("https://res.cloudinary.com/diuukus6j/image/upload/v1701820943/SerraDoTepequem_q7pvr0.webp")
activity14 = Activity.new(
 city: city10,
 user: user1,
 title: "Tepequem Mountains",
 subtitle: "Tepequem Mountains",
 address: "The Municipality of Amajari, in the northern state of Roraima, at the extreme north of Brazil",
 details: "Explore the municipality of Amajari in the state of Roraima in northern Brazil, known for its stunning natural landscapes and rich local culture in the far north of the country.",
 response: nil,
)
activity14.photo.attach(io: file, filename: "#{activity14.title}.png", content_type: "image/png")
activity14.save!


########################################
puts "Creating Activities in São Paulo"

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701818871/prac%CC%A7a_hora%CC%81cio_sabino_jzgr9p.jpg")
activity2 = Activity.new(
  city: city7,
  user: user1,
  title: "Horácio Sabino Park",
  subtitle: "Fun place for dogs and children",
  address: "Praça Horácio Sabino - São Paulo, SP - Brazil",
  details: "A park with appropriate and safe places for dog and children to have fun",
  response: nil,
)
activity2.photo.attach(io: file, filename: "#{activity2.title}.png", content_type: "image/png")
activity2.save!

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701818874/Parque_Ibirapuera_ktczk2.jpg")
activity21 = Activity.new(
  city: city7,
  user: user1,
  title: "Ibirapuera Park",
  subtitle: "Entertainment and culture for you and your dogs",
  address: "Avenida Ibirapuera - São Paulo, SP - Brazil",
  details: "The biggest park in São Paulo, with a huge space for dogs.",
  response: nil,
)
activity21.photo.attach(io: file, filename: "#{activity21.title}.png", content_type: "image/png")
activity21.save!

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701819013/coruja_x0nxzq.jpg")
activity22 = Activity.new(
  city: city7,
  user: user1,
  title: "Coruja Park",
  subtitle: "Broad space for dogs to run around",
  address: "Avenida Ibirapuera - São Paulo, SP - Brazil",
  details: "Broad space for dogs to run around",
  response: nil,
)
activity22.photo.attach(io: file, filename: "#{activity22.title}.png", content_type: "image/png")
activity22.save!

file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701819140/a%CC%81gua_branca_goyftd.jpg")
activity23 = Activity.new(
  city: city7,
  user: user1,
  title: "Água Branca Park",
  subtitle: "Full of trees and flowers to walk your dog",
  address: "Avenida Água Branca - São Paulo, SP - Brazil",
  details: "Full of trees and flowers to walk your dog",
  response: nil,
)
activity23.photo.attach(io: file, filename: "#{activity23.title}.png", content_type: "image/png")
activity23.save!


file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701819347/parque_augusta_we56sk.webp")
activity24 = Activity.new(
  city: city7,
  user: user1,
  title: "Augusta Park",
  subtitle: "A green paradise for you and your pet in downton area",
  address: "Avenida Água Branca - São Paulo, SP - Brazil",
  details: "A green paradise for you and your pet in downton area",
  response: nil,
)
activity24.photo.attach(io: file, filename: "#{activity24.title}.png", content_type: "image/png")
activity24.save!


file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701822140/ativida_vila_lobos_hbqkhd.jpg")
activity25 = Activity.new(
  city: city7,
  user: user1,
  title: "Villa Lobos Park",
  subtitle: "A beautiful paradise for you and your pet",
  address: "Avenida Água Branca - São Paulo, SP - Brazil",
  details: "A beautiful paradise for you and your pet",
  response: nil,
)
activity25.photo.attach(io: file, filename: "#{activity25.title}.png", content_type: "image/png")
activity25.save!



file = URI.open("https://res.cloudinary.com/dxymj7m5b/image/upload/v1701822144/Petz_hfkgvf.jpg")
activity26 = Activity.new(
  city: city7,
  user: user1,
  title: "Petz Store",
  subtitle: "Ads: The place to buy anything and everything for your pet",
  address: "Avenida Água Branca - São Paulo, SP - Brazil",
  details: "Ads: The place to buy anything and everything for your pet",
  response: nil,
)
activity26.photo.attach(io: file, filename: "#{activity26.title}.png", content_type: "image/png")
activity26.save!



##################################################
puts "Creating Trips in Boa Vista"

trip1 = Trip.create!(
 user: user1,
 place: place1,
 start_date: "04/02/2024",
 end_date: "6/02/2024",
)


trip2 = Trip.create!(
 user: user2,
 place: place2,
 start_date: "07/02/2024",
 end_date: "8/02/2024",
)


trip3 = Trip.create!(
 user: user3,
 place: place3,
 start_date: "09/02/2024",
 end_date: "10/02/2024",
)

##################################################
puts "Creating Trips in São Paulo"

trip4 = Trip.create!(
  user: user1,
  place: place10,
  start_date: "01/01/2024",
  end_date: "10/01/2024",
)

trip5 = Trip.create!(
  user: user2,
  place: place11,
  start_date: "01/01/2024",
  end_date: "10/01/2024",
)

trip6 = Trip.create!(
  user: user3,
  place: place12,
  start_date: "01/01/2024",
  end_date: "10/01/2024",
)

trip7 = Trip.create!(
  user: user4,
  place: place2,
  start_date: "01/01/2024",
  end_date: "10/01/2024",
)

##################################################
puts "Creating Appointments in Boa Vista"


ap1 = Appointment.create!(
 trip: trip1,
 activity: activity1,
 date: "04/02/2024",
 hour: "10:30",
)


ap2 = Appointment.create!(
 trip: trip2,
 activity: activity1,
 date: "07/02/2024",
 hour: "16:30",
)


ap3 = Appointment.create!(
 trip: trip3,
 activity: activity1,
 date: "09/02/2024",
 hour: "20:30",
)


##################################################
puts "Creating Appointments in São Paulo"

ap4 = Appointment.create!(
  trip: trip4,
  activity: activity2,
  date: "02/01/2024",
  hour: "13:30",
)

ap5= Appointment.create!(
  trip: trip5,
  activity: activity2,
  date: "02/01/2024",
  hour: "13:30",
)

Appointment.create!(
  trip: trip6,
  activity: activity2,
  date: "02/01/2024",
  hour: "13:30",
)

Appointment.create!(
  trip: trip7,
  activity: activity2,
  date: "02/01/2024",
  hour: "13:30",
)

##################################################
puts "Pets Out Seeded! Uhul!"
