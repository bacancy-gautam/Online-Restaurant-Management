# This file should contain all the record creation needed to seed
#   the database with its default values.
# The data can then be loaded with the rails db:seed command (
#   or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(
  username: 'jinal',
  email: 'jinal.vandara@bacancytechnology.com',
  password: '123456',
  password_confirmation: '123456'
)

user2 = User.create(
  username: 'harshil',
  email: 'harshil.patel@bacancytechnology.com',
  password: '123456',
  password_confirmation: '123456'
)

user3 = User.create(
  username: 'viren',
  email: 'viren.dhanwani@bacancytechnology.com',
  password: '111111',
  password_confirmation: '111111'
)

user1.add_role(:super_admin)
user2.add_role(:super_admin)
user3.add_role(:super_admin)

restaurant1 = Restaurant.create(
  name: '440',
  phone_no: '9898989898',
  email: '440@gmail.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'Thaltej'
)

restaurant2 = Restaurant.create(
  name: '440',
  phone_no: '9898989898',
  email: '440@gmail.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'RTO'
)

restaurant3 = Restaurant.create(
  name: 'US Pizza',
  phone_no: '9090909090',
  email: 'us.pizza@gmail.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'Vasna'
)

restaurant4 = Restaurant.create(
  name: 'McDonald\'s',
  phone_no: '8778878787',
  email: 'mc.donald@yahoo.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'Paldi'
)

restaurant5 = Restaurant.create(
  name: 'The Chocolate Room',
  phone_no: '9876543210',
  email: 'chocolate@yahoo.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'Vastrapur'
)

category1 = Category.create(name: 'Fast Food')
category2 = Category.create(name: 'Punjabi')
category3 = Category.create(name: 'Gujarati')

FoodItem.create(
  name: 'Vadapav',
  price: 30,
  category_id: category1.id,
  restaurant_id: restaurant1.id,
  food_type: 0
)

FoodItem.create(
  name: 'French Fries',
  price: 70,
  category_id: category1.id,
  restaurant_id: restaurant1.id,
  food_type: 0
)

FoodItem.create(
  name: 'Chocolate Pastry',
  price: 60,
  category_id: category1.id,
  restaurant_id: restaurant5.id,
  food_type: 0
)

FoodItem.create(
  name: 'Black Forest Pastry',
  price: 65,
  category_id: category1.id,
  restaurant_id: restaurant5.id,
  food_type: 0
)

FoodItem.create(
  name: 'Pizza',
  price: 110,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  food_type: 0
)
