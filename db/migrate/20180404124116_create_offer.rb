class CreateOffer < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.decimal :discount
      t.references :food_item, foreign_key: true
    end
  end
end
