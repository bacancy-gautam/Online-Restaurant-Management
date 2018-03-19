class AddCompositeKeyToRestaurant < ActiveRecord::Migration[5.1]
  def change
  	add_index :restaurants, [:name, :branch_name], :unique => true
  end
end
