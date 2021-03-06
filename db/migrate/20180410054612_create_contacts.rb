class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
