# Model for Restaurant
class Restaurant < ApplicationRecord
  enum type: [:take_away, :home_delivery]

  has_many :food_items
  has_one :address, as: :addressable, dependent: :destroy
  has_and_belongs_to_many :categories

  VALID_MOBILE_REGEX = /\A^[789]\d{9}$\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true
  validates :phone_no, presence: true, format: { with: VALID_MOBILE_REGEX }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :branch_name, presence: true

  accepts_nested_attributes_for :address
end
