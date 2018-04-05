class Favourite < ApplicationRecord
  belongs_to :favouriteable, polymorphic: true

  def fav_restaurant
    Restaurant.find(self.favouriteable_id)
  end

  def fav_food
    FoodItem.find(self.favouriteable_id)
  end

end
