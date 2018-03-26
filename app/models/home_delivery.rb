# this model will manage home delivery and keeps records
class HomeDelivery < ApplicationRecord
  belongs_to :master_order
  belongs_to :address
  has_many :delivery_boy
  enum status: ['pending', 'ok']
end
