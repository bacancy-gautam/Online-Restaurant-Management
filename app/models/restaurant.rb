# Model for Restaurant
class Restaurant < ApplicationRecord
  enum type: [:take_away, :home_delivery]
  ratyrate_rateable 'service', 'food'
  has_many :food_items
  has_many :images, as: :imageable, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_and_belongs_to_many :categories
  has_many :favourites, as: :favouriteable
  has_many :reviews
  has_many :offer
  has_and_belongs_to_many :categories
  
  VALID_MOBILE_REGEX = /\A^[789]\d{9}$\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true
  validates :phone_no, presence: true, format: { with: VALID_MOBILE_REGEX }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :branch_name, presence: true

  accepts_nested_attributes_for :address

  def restaurant_open?
    self.opening_time.strftime('%I:%M %p') <= Time.now && self.closing_time.strftime('%I:%M %p') >= Time.now
  end
  mount_uploader :image, ImageUploader

  def avg_rate
    stars = Rate.all.where(rateable_id: self.id).pluck(:stars)
    if stars != []
      sum = stars.inject :+
      avg = sum / stars.length
    end
  end

  def full_name
    "#{self.name}, #{self.branch_name}, #{self.try(:address).try(:city)}"
  end
end
