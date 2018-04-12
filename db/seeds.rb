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

user5_attributes = {
  username: 'vaishali',
  email: 'vaishali.pitroda@bacancytechnology.com',
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
user5 = find_or_create_user(user5_attributes)

user1.roles.delete_all
user1.add_role(:super_admin)
user2.roles.delete_all
user2.add_role(:admin)
user3.roles.delete_all
user3.add_role(:super_admin)
user4.roles.delete_all
user4.add_role(:super_admin)
user5.roles.delete_all
user5.add_role(:super_admin)

#========================= ADDRESS OF USER =========================

user5.addresses.create(
  addressline: 'Address: Shop No 5,6 Jawahar Shopping Center',
  area: 'Manainagar',
  city: 'Ahmedabad',
  state: 'Gujarat',
  pincode: '380009'
  )

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
  opening_time: Time.now - 4.hours,
  closing_time: Time.now + 4.hours,
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
  opening_time: Time.now - 5.hours,
  closing_time: Time.now + 2.hours,
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
  opening_time: Time.now - 3.hours,
  closing_time: Time.now + 9.hours,
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
  pincode: '380089'
)

restaurant5 = Restaurant.create(
  name: '440',
  phone_no: '9898989898',
  email: '440@gmail.com',
  opening_time: Time.now - 2.hours,
  closing_time: Time.now + 7.hours,
  branch_name: 'RTO',
  user_id: user1.id,
  details: 'Service excellence is our speciality and we are known for the same.'
)

restaurant5.create_address(
  addressline: 'RTO',
  area: 'RTO',
  city: 'Ahmedabad',
  state: 'Gujarat',
  pincode: '380003'
)

#========================= CATEGORY =========================

category1 = Category.create(name: 'Fast Food')
category2 = Category.create(name: 'Punjabi')
category3 = Category.create(name: 'Gujarati')

#========================= FOOD CATEGORY =========================

food_category1 = category1.food_categories.create(name: 'Pastas')
food_category12 = category1.food_categories.create(name: 'Salads')
food_category13 = category1.food_categories.create(name: 'Beverages')

food_category2 = category2.food_categories.create(name: "Starter")
food_category3 = category2.food_categories.create(name: "Main Course")
food_category4 = category2.food_categories.create(name: "Dessert")
food_category5 = category2.food_categories.create(name: 'Soups')
food_category6 = category2.food_categories.create(name: 'Pastas')

food_category7 = category3.food_categories.create(name: "Starter")
food_category8 = category3.food_categories.create(name: "Main Course")
food_category9 = category3.food_categories.create(name: "Dessert")
food_category10 = category3.food_categories.create(name: 'Soups')
food_category11 = category3.food_categories.create(name: 'Pastas')

#========================= FOOD ITEM =========================

FoodItem.create(
  name: 'Paneer Tikka Masala',
  price: 30,
  category_id: category2.id,
  restaurant_id: restaurant1.id,
  description: 'Paneer Tikka Masala',
  food_type: 0,
  food_category_id: food_category3.id
)

FoodItem.create(
  name: 'Sev Tomato',
  price: 125,
  category_id: category2.id,
  restaurant_id: restaurant1.id,
  description: 'Sev Tomato',
  food_type: 0,
  food_category_id: food_category3.id
)

FoodItem.create(
  name: 'Mediterranean Pasta',
  price: 179,
  category_id: category1.id,
  restaurant_id: restaurant2.id,
  description: 'Mediterranean Pasta',
  food_type: 0,
  food_category_id: food_category1.id
)

FoodItem.create(
  name: 'Tomato Basil Soup',
  price: 65,
  category_id: category1.id,
  restaurant_id: restaurant2.id,
  description: 'Tomato Basil Soup',
  food_type: 0,
  food_category_id: food_category5.id
)

FoodItem.create(
  name: 'Corn & Peas Salad',
  price: 172,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: 'Corn & Peas Salad',
  food_type: 0,
  food_category_id: food_category12.id
)

FoodItem.create(
  name: 'Veggie Delite Salad',
  price: 102,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: 'Veggie Delite Salad',
  food_type: 0,
  food_category_id: food_category12.id
)

FoodItem.create(
  name: 'Tuna Salad',
  price: 35,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: 'Tuna Salad',
  food_type: 1,
  food_category_id: food_category12.id
)

FoodItem.create(
  name: 'Subway Club Salad',
  price: 25,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: 'Subway Club Salad',
  food_type: 1,
  food_category_id: food_category12.id
)

FoodItem.create(
  name: 'Tropicana Mixed Fruit Juice (200 ml)',
  price: 30,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: 'Tropicana Mixed Fruit Juice (200 ml)',
  food_type: 0,
  food_category_id: food_category13.id
)

FoodItem.create(
  name: 'Aquavess Water Bottle (200 ml)',
  price: 30,
  category_id: category1.id,
  restaurant_id: restaurant3.id,
  description: 'Aquavess Water Bottle (200 ml)',
  food_type: 0,
  food_category_id: food_category13.id
)
