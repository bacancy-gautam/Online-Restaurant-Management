# this model will create instance of All FoodItems of all restaurants
class FoodItem < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant
  has_one :order
  has_many :favourites, as: :favouriteable
  enum food_type: [:veg, :non_veg]
end
