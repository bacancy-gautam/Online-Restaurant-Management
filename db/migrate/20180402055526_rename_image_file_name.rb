class RenameImageFileName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :food_items, :image_file_name, :image
  	rename_column :restaurants, :image_file_name, :image
  	rename_column :users, :image_file_name, :image
  end
end
