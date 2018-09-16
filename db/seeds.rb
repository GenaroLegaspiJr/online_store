# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
vat = [ { name: "Zero", rate: 0 }, { name: "Reduced", rate: 0.05 }, { name: "Standard", rate: 0.20 } ]

vat.each do |v|
  Vat.create v
end

items = [ { code: "01", name: "Scotland Flag", price: 20, vat: Vat.find_by_name("Zero") }, 
          { code: "02", name: "Children's Car Seat", price: 33.90, vat: Vat.find_by_name("Reduced") },
          { code: "03", name: "Magnetic Wrist Band", price: 9, vat: Vat.find_by_name("Standard") } ]

items.each do |item|
  Item.create item 
end