class AddStatusToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :status, :boolean
  end
end
