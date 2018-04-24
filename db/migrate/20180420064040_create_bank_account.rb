class CreateBankAccount < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.string :currency
      t.string :country
      t.string :account_holder_name
      t.string :account_holder_type
      t.string :route_no
      t.string :number
    end
  end
end
