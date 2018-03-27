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
  branch_name: 'Thaltej',
  details: 'Service excellence is our speciality and we are known for the same.'
)

Restaurant.create(
  name: '440',
  phone_no: '9898989898',
  email: '440@gmail.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'RTO',
  details: 'Service excellence is our speciality and we are known for the same.'
)

restaurant3 = Restaurant.create(
  name: 'US Pizza',
  phone_no: '9090909090',
  email: 'us.pizza@gmail.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'Vasna',
  details: 'Every guest is important for us and the same way we give due attention on every occasion celebrated at our banquet.'
)

Restaurant.create(
  name: 'McDonald\'s',
  phone_no: '8778878787',
  email: 'mc.donald@yahoo.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'Paldi',
  details: 'McDonald\'s is an American fast food company, founded in 1940 as a restaurant operated by Richard and Maurice McDonald, in San Bernardino, California, United States. They rechristened their business as a hamburger stand.'
)

restaurant5 = Restaurant.create(
  name: 'The Chocolate Room',
  phone_no: '9876543210',
  email: 'chocolate@yahoo.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'Vastrapur',
  details: 'The Chocolate Room India serves the quality and naturally prepared chocolate desserts to all its customers.'
)

category1 = Category.create(name: 'Fast Food')
Category.create(name: 'Punjabi')
Category.create(name: 'Gujarati')

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
