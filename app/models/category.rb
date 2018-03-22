class Category < ApplicationRecord
  has_many :food_items
  has_and_belongs_to_many :restaurants
  has_many :food_items
  validates :name, :presence => true,uniqueness: { scope: :name ,message: "category allready added" }
end
