class FoodItem < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant
  has_one :order
  enum food_type: [:veg,:non_veg]
end
