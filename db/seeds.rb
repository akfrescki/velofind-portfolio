# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Report.destroy_all
Match.destroy_all
Promo.destroy_all
Bike.destroy_all
User.destroy_all

puts "Creating Users ..."

helene = User.create!(
  email: "helene@example.com",
  password: "123456789",
  first_name: "Helene",
  last_name: "Gaspar",
  phone_number: "+33 6 01 02 03 04"
)

ana = User.create!(
  email: "ana@example.com",
  password: "123456789",
  first_name: "Ana",
  last_name: "Frecki",
  phone_number: "+31 6 01020304"
)

axel = User.create!(
  email: "axel@example.com",
  password: "123456789",
  first_name: "Axel",
  last_name: "Houillier",
  phone_number: "+32 484 010 203"
)

puts "Users created !"

puts "Creating Bikes ..."

sport_bike_helene = Bike.create!(
  brand: "Trek",
  frame_number: "TR0475/022",
  model: "Dual Sport 2",
  stolen_date: Time.now - 24.hours,
  location_lost: "Paris",
  status: 0,
  first_search_date: Time.now,
  color: "Blue",
  user_id: helene.id
)

electric_bike_ana = Bike.create!(
  brand: "EXS Bike",
  frame_number: "CB7875/024",
  model: "Chantenay 28\"",
  stolen_date: Time.now - 24.hours,
  location_lost: "Utrecht",
  status: 0,
  first_search_date: Time.now,
  color: "Black",
  user_id: ana.id
)

fixie_bike_axel = Bike.create!(
  brand: "Elops",
  frame_number: "EL4857/025",
  model: "Single Speed",
  stolen_date: Time.now - 24.hours,
  location_lost: "Brussels",
  status: 0,
  first_search_date: Time.now,
  color: "Green",
  user_id: axel.id
)

puts "Bikes created !"

puts "Creating Promos ..."

lock_promo = Promo.create!(
  name: "Kryptonite Evolution 1090 - 90cm",
  description: "A super strong lock, perfect to protect your bike from theft",
  promocode: "VeloFind-Summer-1",
  website_url: "https://upway.be/products/chane-kryptonite-evolution-1090-90cm"
)

helmet_promo = Promo.create!(
  name: "Black Helmet Kask Sintesi",
  description: "A very elegant helmet, comfortable and protective",
  promocode: "VeloFind-Summer-2",
  website_url: "https://www.bobshop.com/fr/kask/casque-sintesi/noir/"
)

light_promo = Promo.create!(
  name: "Led lamps for Bike - front and back",
  description: "Rechargeable USB lamps, with different intensity and options",
  promocode: "VeloFind-Summer-3",
  website_url: "https://www.decathlon.be/fr/p/mp/tikkens/eclairage-velo-led-lumiere-velo-set-lampe-arriere-et-avant/_/R-p-e02f3e19-fc5e-4ce7-86c1-66d8725419c2?mc=e02f3e19-fc5e-4ce7-86c1-66d8725419c2_c1&c=noir"
)

puts "Promos created !"

puts "Creating matches ..."

match01 = Match.create!(
  bike_id: sport_bike_helene.id,
  marketplace_url: "https://www.leboncoin.fr/",
  marketplace: "Le bon coin",
  match_score: 90,
  price: 450,
  seller: "Anonymous Seller 1",
  location: "Lille"
)

match02 = Match.create!(
  bike_id: sport_bike_helene.id,
  marketplace_url: "https://buycycle.com/nl-be",
  marketplace: "Buycycle",
  match_score: 75,
  price: 380,
  seller: "Anonymous Seller 2",
  location: "Kortrijk"
)

match03 = Match.create!(
  bike_id: electric_bike_ana.id,
  marketplace_url: "https://www.2dehands.be/",
  marketplace: "2de hands",
  match_score: 87,
  price: 600,
  seller: "Anonymous Seller 3",
  location: "Den Haag"
)

puts "Matches created !"

puts "Creating reports ..."

report01 = Report.create!(
  match_id: match01.id
)

report02 = Report.create!(
  match_id: match02.id
)
report03 = Report.create!(
  match_id: match03.id
)

puts "Reports created"

puts "Creating Promos ..."

lock_promo = Promo.create!(
  name: "Kryptonite Evolution 1090 - 90cm",
  description: "A super strong lock, perfect to protect your bike from theft",
  promocode: "VeloFind-Summer-1",
  website_url: "https://upway.be/products/chane-kryptonite-evolution-1090-90cm"
)

helmet_promo = Promo.create!(
  name: "Black Helmet Kask Sintesi",
  description: "A very elegant helmet, comfortable and protective",
  promocode: "VeloFind-Summer-2",
  website_url: "https://www.bobshop.com/fr/kask/casque-sintesi/noir/"
)

light_promo = Promo.create!(
  name: "Led lamps for Bike - front and back",
  description: "Rechargeable USB lamps, with different intensity and options",
  promocode: "VeloFind-Summer-3",
  website_url: "https://www.decathlon.be/fr/p/mp/tikkens/eclairage-velo-led-lumiere-velo-set-lampe-arriere-et-avant/_/R-p-e02f3e19-fc5e-4ce7-86c1-66d8725419c2?mc=e02f3e19-fc5e-4ce7-86c1-66d8725419c2_c1&c=noir"
)

bonus_lock_promo = Promo.create!(
  name: "Kryptonite U-Lock Mini-7 with Flex",
  description: "Compact and strong U-lock with cable — perfect for urban bikers",
  promocode: "VeloFind-Bonus-4",
  website_url: "https://example.com/kryptonite-u-lock-mini-7"
)

puts "Promos created !"
