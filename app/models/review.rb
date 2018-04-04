class Review < ApplicationRecord
  belongs_to :restaurant
  default_scope -> { order(created_at: :desc) }
end
