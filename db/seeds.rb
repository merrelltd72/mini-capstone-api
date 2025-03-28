# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(name: 'John', email: 'john@example.com', password: 'password', admin: true)
User.create!(name: 'Test', email: 'test@example.com', password: 'password')

Category.create!(name: 'Game Systems')
Category.create!(name: 'Retro Game Systems')
Category.create!(name: 'Microsoft Game Systems')

Supplier.create!(name: 'Sony', email: 'sony@example.com', phone_number: '3234345566')
Supplier.create!(name: 'Microsoft', email: 'wedabestsoftware@example.com', phone_number: '5155552345')
Supplier.create!(name: 'Nintendo', email: 'nintendo@example.com', phone_number: '4423445678')

Product.create!(name: 'PS5', description: 'Best selling gaming console', price: 499.99, supplier_id: 1)
Product.create!(name: 'Xbox Series X', description: '2nd Best selling gaming console', price: 494.99, supplier_id: 2)
Product.create!(name: 'Nintendo Switch', description: '3rd Best selling gaming console', price: 349.99, supplier_id: 3)
Product.create!(name: 'Nintendo HADSKABAH Switch with Neon Blue and Neon Red Joycon',
                description: 'TV mode Dock your system to enjoy HD gaming on your TV. Tabletop mode Flip the stand to share the screen, then share the fun with a multiplayer game. Handheld mode Pick it up and play with the Joy-Con controllers attached to enjoy the 6.2 inch LCD touch screen This is JoyCon The included JoyCon controllers give you total gameplay flexibility. Choose your control style One controller or two, vertical or sideways, attached to the console or separate.', price: 399.99, supplier_id: 3)

Image.create!(product_id: 1, url: 'https://blog.playstation.com/tachyon/2023/10/cd56722db7b991b3d7a33f1bafd55f80d0ac553d.png')
Image.create!(product_id: 2, url: 'https://cdn.mos.cms.futurecdn.net/eH7muHj6y4RyJ5QYkGX8oT-1200-80.jpg')
Image.create!(product_id: 3, url: 'https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/en_US/products/hardware/nintendo-switch-red-blue/110478-nintendo-switch-neon-blue-neon-red-front-screen-on-1200x675')
Image.create!(product_id: 4, url: 'https://assets.nintendo.com/image/upload/ar_16:9,b_auto:border,c_lpad/b_white/f_auto/q_auto/dpr_1.5/c_scale,w_400/ncom/en_US/products/hardware/nintendo-switch-red-blue/110478-nintendo-switch-neon-blue-neon-red-front-screen-on-lifestyle-1200x675')

CategoryProduct.create!(product_id: 1, category_id: 1)
CategoryProduct.create!(product_id: 2, category_id: 1)
CategoryProduct.create!(product_id: 3, category_id: 1)
CategoryProduct.create!(product_id: 4, category_id: 1)
CategoryProduct.create!(product_id: 4, category_id: 2)
CategoryProduct.create!(product_id: 2, category_id: 3)
CategoryProduct.create!(product_id: 3, category_id: 3)
