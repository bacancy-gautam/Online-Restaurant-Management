class FoodItem < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant
end
