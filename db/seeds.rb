# This file should contain all the record creation needed to seed
#   the database with its default values.
# The data can then be loaded with the rails db:seed command (
#   or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)

#========================= USER =========================

user1_attributes = {
  username: 'jinal',
  email: 'jinal.vandara@bacancytechnology.com',
  password: '123456',
  password_confirmation: '123456'
}

user2_attributes = {
  username: 'harshil',
  email: 'harshil.patel@bacancytechnology.com',
  password: '123456',
  password_confirmation: '123456'
}

user3_attributes = {
  username: 'viren',
  email: 'viren.dhanwani@bacancytechnology.com',
  password: '111111',
  password_confirmation: '111111'
}

user4_attributes = {
  username: 'vishal',
  email: 'vishal.jariwala@bacancytechnology.com',
  password: '123456',
  password_confirmation: '123456'
}

def find_or_create_user(user_attrs)
  email = user_attrs[:email]
  user = User.find_by_email(email)

  if user.nil?
    user = User.create(user_attrs)
    puts "Created user having email #{email}"
  else
    puts "User having email #{email} already exists, thus not created"
  end
  user
end

user1 = find_or_create_user(user1_attributes)
user2 = find_or_create_user(user2_attributes)
user3 = find_or_create_user(user3_attributes)
user4 = find_or_create_user(user4_attributes)

user1.roles.delete_all
user1.add_role(:super_admin)
user2.roles.delete_all
user2.add_role(:super_admin)
user3.roles.delete_all
user3.add_role(:super_admin)
user4.roles.delete_all
user4.add_role(:super_admin)

Role.create(name: "admin")

#========================= RESTAURANT =========================

restaurant1 = Restaurant.create(
  name: '440',
  phone_no: '9898989898',
  email: '440@gmail.com',
  opening_time: Time.now - 2.hours,
  closing_time: Time.now + 8.hours,
  branch_name: 'Thaltej',
  user_id: user1.id,
  details: 'Service excellence is our speciality and we are known for the same.'
)

restaurant1.create_address(
  addressline: 'ABC',
  area: 'Thaltej',
  city: 'Ahmedabad',
  state: 'Gujarat',
  pincode: '380009',
)

restaurant2 = Restaurant.create(
  name: 'The Chocolate Room',
  phone_no: '9876543210',
  email: 'chocolate@yahoo.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'Vastrapur',
  user_id: user2.id,
  details: 'The Chocolate Room India serves the quality and naturally
   prepared chocolate desserts to all its customers.'
)

restaurant2.create_address(
  addressline: 'PQR',
  area: 'Vastrapur',
  city: 'Ahmedabad',
  state: 'Gujarat',
  pincode: '380005',
)

restaurant3 = Restaurant.create(
  name: 'Subway',
  phone_no: '9090909090',
  email: 'subway@gmail.com',
  opening_time: Time.now - 1.hours,
  closing_time: Time.now + 8.hours,
  branch_name: 'Navrangpura',
  user_id: user3.id,
  details: 'Every guest is important for us and the same way we give
   due attention on every occasion celebrated at our banquet.'
)

restaurant3.create_address(
  addressline: 'Times Square',
  area: 'Navrangpura',
  city: 'Ahmedabad',
  state: 'Gujarat',
  pincode: '380001',
)

restaurant4 = Restaurant.create(
  name: 'McDonald\'s',
  phone_no: '8778878787',
  email: 'mc.donald@yahoo.com',
  opening_time: Time.now,
  closing_time: Time.now,
  branch_name: 'Paldi',
  user_id: user4.id,
  details: 'McDonald\'s is an American fast food company,
   founded in 1940 as a restaurant operated by Richard and Maurice McDonald,
    in San Bernardino, California, United States.
     They rechristened their business as a hamburger stand.'
)

restaurant4.create_address(
  addressline: 'Bacancy',
  area: 'Paldi',
  city: 'Ahmedabad',
  state: 'Gujarat',
  pincode: '380089',
)

restaurant5 = Restaurant.create(
  name: '440',
  phone_no: '9898989898',
  email: '440@gmail.com',
  opening_time: Time.now - 1.hours,
  closing_time: Time.now + 8.hours,
  branch_name: 'RTO',
  user_id: user1.id,
  details: 'Service excellence is our speciality and we are known for the same.'
)

restaurant5.create_address(
  addressline: 'RTO',
  area: 'RTO',
  city: 'Ahmedabad',
  state: 'Gujarat',
  pincode: '380003',
)

#========================= CATEGORY =========================

category1 = Category.create(name: 'Fast Food')
Category.create(name: 'Punjabi')
Category.create(name: 'Gujarati')

#========================= FOOD ITEM =========================

FoodItem.create(
  name: 'Vadapav',
  price: 30,
  category_id: category1.id,
  restaurant_id: restaurant1.id,
  description: 'Vadapav',
  food_type: 0
)

FoodItem.create(
  name: 'French Fries',
  price: 70,
  category_id: category1.id,
  restaurant_id: restaurant1.id,
  description: 'French Fries',
  food_type: 0
)

FoodItem.create(
  name: 'Chocolate Pastry',
  price: 60,
  category_id: category1.id,
  restaurant_id: restaurant2.id,
  description: 'Chocolate Pastry',
  food_type: 0
)

FoodItem.create(
  name: 'Black Forest Pastry',
  price: 65,
  category_id: category1.id,
  restaurant_id: restaurant2.id,
  description: 'Black Forest Pastry',
  food_type: 0
)

FoodItem.create(
  name: '6" Veggie Delite Sub',
  price: 172,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: '6" Veggie Delite Sub',
  food_type: 0
)

FoodItem.create(
  name: 'Veggie Delite Salad',
  price: 102,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: 'Veggie Delite Salad',
  food_type: 0
)

FoodItem.create(
  name: 'Veg Shammi Subwrap',
  price: 35,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: 'Veg Shammi Subwrap',
  food_type: 0
)

FoodItem.create(
  name: 'Cookie',
  price: 25,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: 'Cookie',
  food_type: 1
)

FoodItem.create(
  name: '6" Chatpata Chana Patty Sub',
  price: 72,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: '6" Chatpata Chana Patty Sub',
  food_type: 0
)