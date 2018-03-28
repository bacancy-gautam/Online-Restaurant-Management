class RemovePriceFromOffer < ActiveRecord::Migration[5.1]
  def change
    remove_column :offers, :price, :decimal
  end
end
