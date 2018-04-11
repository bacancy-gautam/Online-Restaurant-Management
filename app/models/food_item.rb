# this model will create instance of All FoodItems of all restaurants
class FoodItem < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant
  has_one :offer, dependent: :destroy
  has_one :order
  has_many :favourites, as: :favouriteable
  belongs_to :food_category
  has_many :images, as: :imageable, dependent: :destroy
  mount_uploader :image, ImageUploader
  enum food_type: [:veg, :non_veg]
  validates :restaurant_id,
            :category_id,
            :food_type,
            :price, presence: true

end
