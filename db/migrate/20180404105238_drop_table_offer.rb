class DropTableOffer < ActiveRecord::Migration[5.1]
  def change
    drop_table :offers
  end

end
