class AddIsActiveToDeliveryBoys < ActiveRecord::Migration[5.1]
  def change
    add_column :delivery_boys, :is_active, :boolean
  end
end