# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

products = [
  { name: "PS5", description: "Best selling gaming console", price: "499.99"},
  { name: "Xbox Series X", description: "2nd Best selling gaming console", price: "494.99"},
  { name: "Nintendo Switch", description: "3rd Best selling gaming console", price: "349.99"}
]

products.each do |product|
  Product.find_or_create_by(product)
end

suppliers = [
  { name: "Sony", email: "sony@example.com", phone_number: "3234345566" }, { name: "Microsoft", email: "wedabestsoftware@example.com" }, { name: "Nintendo", email: "nintendo@example.com"}
]

suppliers.each do |supplier|
  Supplier.find_or_create_by(supplier)
end

images = [
  { supplier_id: 1, url: "https://blog.playstation.com/tachyon/2023/10/cd56722db7b991b3d7a33f1bafd55f80d0ac553d.png" }, {supplier_id: 2, url: "https://cdn.mos.cms.futurecdn.net/eH7muHj6y4RyJ5QYkGX8oT-1200-80.jpg"}, { supplier_id: 3, url: "https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/en_US/products/hardware/nintendo-switch-red-blue/110478-nintendo-switch-neon-blue-neon-red-front-screen-on-1200x675" }

]