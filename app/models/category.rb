class Category < ApplicationRecord
	has_and_belongs_to_many :restaurants
  has_many :food_items
end
