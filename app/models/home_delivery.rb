class HomeDelivery < ApplicationRecord
  belongs_to :master_order
  belongs_to :address
end
