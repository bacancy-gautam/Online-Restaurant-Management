class MasterOrder < ApplicationRecord
	has_many :orders
  enum order_type: ["homedelivery","pickup"]
  enum payment_type: ["cod","card"]
  enum order_status: ["placed","inprogress","ready","deliverd"]
  enum payment_status: ["pending","paid"]
end
