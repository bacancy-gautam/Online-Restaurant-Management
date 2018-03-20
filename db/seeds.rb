# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'jinal',email: 'jinal.vandara@bacancytechnology.com',password: '123456',password_confirmation: '123456')
user1.add_role(:super_admin)

user2 = User.create(username: 'viren',
  email: 'viren.dhanwani@bacancytechnology.com',
  password: '111111',
  password_confirmation: '111111')
user2.add_role(:super_admin)
