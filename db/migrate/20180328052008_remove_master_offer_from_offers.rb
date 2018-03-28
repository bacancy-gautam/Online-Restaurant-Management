class RemoveMasterOfferFromOffers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :offers, :master_offer
  end
end
