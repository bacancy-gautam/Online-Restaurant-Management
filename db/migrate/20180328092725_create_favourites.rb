class CreateFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.references :users, foreign_key: true
      t.references :food_items, foreign_key: true

      t.timestamps
    end
  end
end
