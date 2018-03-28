class Favourite < ApplicationRecord
  belongs_to :users
  belongs_to :food_items
end
