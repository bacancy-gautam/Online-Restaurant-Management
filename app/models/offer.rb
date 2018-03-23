# this model will create intance of all offers
class Offer < ApplicationRecord
  belongs_to :restaurant
  belongs_to :food_item
  belongs_to :master_offer
end
