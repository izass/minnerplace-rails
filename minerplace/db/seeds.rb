# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


LineItem.destroy_all
Cart.destroy_all
Product.destroy_all
Category.destroy_all

beverages = Category.create({name: 'Beverages'})
snacks = Category.create({name: 'Snacks'})
bakery = Category.create({name: 'Bakery'})
personalcare = Category.create({name: 'Personal Care'})

# Beverages
beverages.products.create!([
  { name: 'Tea', description: 'A soothing beverage.', sku: 'TEA', price: 4.99, currency: 'USD', inventory: 5 },
  { name: 'Coffee', description: 'A strong and bold beverage.', sku: 'COFFEE', price: 5.99, currency: 'USD', inventory: 10 },
  { name: 'Lemonade', description: 'A refreshing citrus drink.', sku: 'LEMON', price: 3.50, currency: 'USD', inventory: 7 },
  { name: 'Smoothie', description: 'A healthy fruit drink.', sku: 'SMOOTH', price: 6.75, currency: 'USD', inventory: 3 },
  { name: 'Soda', description: 'A fizzy and sweet drink.', sku: 'SODA', price: 2.99, currency: 'USD', inventory: 12 },
  { name: 'Hot Chocolate', description: 'A warm and sweet drink.', sku: 'HOTCHOC', price: 4.50, currency: 'USD', inventory: 8 },
  { name: 'Iced Tea', description: 'A cool and refreshing drink.', sku: 'ICETEA', price: 3.99, currency: 'USD', inventory: 4 },
  { name: 'Milkshake', description: 'A creamy and thick drink.', sku: 'MILKSHAKE', price: 5.50, currency: 'USD', inventory: 6 },
  { name: 'Water', description: 'A pure and essential drink.', sku: 'WATER', price: 1.00, currency: 'USD', inventory: 15 },
  { name: 'Orange Juice', description: 'A fresh and tangy drink.', sku: 'OJ', price: 4.25, currency: 'USD', inventory: 9 }
])

# Snacks
snacks.products.create!([
  { name: 'Chips', description: 'Crispy and salty snack.', sku: 'CHIPS', price: 2.99, currency: 'USD', inventory: 11 },
  { name: 'Chocolate Bar', description: 'Sweet and rich chocolate.', sku: 'CHOCBAR', price: 1.99, currency: 'USD', inventory: 7 },
  { name: 'Pretzels', description: 'Crunchy and salty pretzels.', sku: 'PRETZEL', price: 3.49, currency: 'USD', inventory: 5 },
  { name: 'Granola Bar', description: 'Healthy and nutritious snack.', sku: 'GRANOLA', price: 1.49, currency: 'USD', inventory: 8 },
  { name: 'Popcorn', description: 'Light and airy snack.', sku: 'POPCORN', price: 2.25, currency: 'USD', inventory: 6 },
  { name: 'Gummy Bears', description: 'Chewy and fruity candies.', sku: 'GUMMY', price: 2.75, currency: 'USD', inventory: 4 },
  { name: 'Trail Mix', description: 'A mix of nuts and dried fruits.', sku: 'TRAIL', price: 4.99, currency: 'USD', inventory: 3 },
  { name: 'Cookies', description: 'Sweet and crunchy cookies.', sku: 'COOKIE', price: 3.99, currency: 'USD', inventory: 9 },
  { name: 'Beef Jerky', description: 'Savory and chewy meat snack.', sku: 'JERKY', price: 5.99, currency: 'USD', inventory: 2 },
  { name: 'Fruit Snacks', description: 'Sweet and fruity snacks.', sku: 'FRUITSNACK', price: 2.49, currency: 'USD', inventory: 10 }
])

# Bakery
bakery.products.create!([
  { name: 'Bread', description: 'Freshly baked bread.', sku: 'BREAD', price: 3.00, currency: 'USD', inventory: 14 },
  { name: 'Croissant', description: 'Buttery and flaky croissant.', sku: 'CROISSANT', price: 2.50, currency: 'USD', inventory: 12 },
  { name: 'Muffin', description: 'Soft and sweet muffin.', sku: 'MUFFIN', price: 1.75, currency: 'USD', inventory: 9 },
  { name: 'Bagel', description: 'Chewy and delicious bagel.', sku: 'BAGEL', price: 2.00, currency: 'USD', inventory: 8 },
  { name: 'Cake', description: 'Decadent and moist cake.', sku: 'CAKE', price: 15.00, currency: 'USD', inventory: 5 },
  { name: 'Cookie', description: 'Sweet and crunchy cookie.', sku: 'COOKIE', price: 1.50, currency: 'USD', inventory: 7 },
  { name: 'Doughnut', description: 'Sweet and fluffy doughnut.', sku: 'DOUGHNUT', price: 1.25, currency: 'USD', inventory: 11 },
  { name: 'Brownie', description: 'Rich and chocolaty brownie.', sku: 'BROWNIE', price: 2.25, currency: 'USD', inventory: 10 },
  { name: 'Puff Pastry', description: 'Light and flaky puff pastry.', sku: 'PUFFPASTRY', price: 3.75, currency: 'USD', inventory: 6 },
  { name: 'Scone', description: 'Soft and crumbly scone.', sku: 'SCONE', price: 2.50, currency: 'USD', inventory: 4 }
])

# Personal Care
personalcare.products.create!([
  { name: 'Shampoo', description: 'Cleans and nourishes hair.', sku: 'SHAMPOO', price: 6.99, currency: 'USD', inventory: 7 },
  { name: 'Conditioner', description: 'Smoothens and softens hair.', sku: 'CONDITIONER', price: 6.99, currency: 'USD', inventory: 6 },
  { name: 'Toothpaste', description: 'Whitens and strengthens teeth.', sku: 'TOOTHPASTE', price: 3.49, currency: 'USD', inventory: 8 },
  { name: 'Body Lotion', description: 'Moisturizes and hydrates skin.', sku: 'LOTION', price: 7.99, currency: 'USD', inventory: 10 },
  { name: 'Soap', description: 'Cleanses and refreshes skin.', sku: 'SOAP', price: 1.99, currency: 'USD', inventory: 12 },
  { name: 'Deodorant', description: 'Keeps you fresh all day.', sku: 'DEODORANT', price: 4.99, currency: 'USD', inventory: 4 },
  { name: 'Face Wash', description: 'Cleanses and rejuvenates skin.', sku: 'FACEWASH', price: 5.49, currency: 'USD', inventory: 5 },
  { name: 'Hand Sanitizer', description: 'Kills 99.9% of germs.', sku: 'SANITIZER', price: 2.99, currency: 'USD', inventory: 9 },
  { name: 'Shaving Cream', description: 'Smooth shaving experience.', sku: 'SHAVECRM', price: 3.99, currency: 'USD', inventory: 2 },
  { name: 'Sunscreen', description: 'Protects skin from UV rays.', sku: 'SUNSCREEN', price: 8.99, currency: 'USD', inventory: 3 }
])

2.times do |i|
  cart = Cart.create!(customer_email: "customer#{i + 1}@email.com")
  cart.line_items.create!([
    {product: [beverages, snacks, personalcare, bakery].sample.products[rand(0..4)], quantity: rand(1..2)}, 
    {product: [beverages, snacks, personalcare, bakery].sample.products[rand(5..9)], quantity: rand(1..2)}
  ])
  cart.update_total_price
  cart.save!
end

5.times do |i|
  DiscountCode.create!(
    code: "CODE#{i + 1}",
    amount: rand(10..50),
    discount_type: ['fixed', 'percentage'].sample,
    expires_at: DateTime.now + rand(1..30).days,
    usage_limit: rand(1..10)
  )
end