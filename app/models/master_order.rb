# this model will keep records of all confirm orders
class MasterOrder < ApplicationRecord
  has_many :orders
  has_one :users
  
  enum order_type: ['homedelivery', 'pickup']
  enum payment_type: ['cod', 'card']
  enum order_status: ['placed', 'inprogress', 'ready', 'deliverd']
  enum payment_status: ['pending', 'paid']
end
