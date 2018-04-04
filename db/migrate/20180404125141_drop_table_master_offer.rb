class DropTableMasterOffer < ActiveRecord::Migration[5.1]
  def change
    drop_table :master_offers
  end
end
