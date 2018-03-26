class AddDeliveryBoyToHomeDelivery < ActiveRecord::Migration[5.1]
  def change
    add_reference :home_deliveries, :delivery_boy, foreign_key: true
  end
end
