class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.text :name
      t.text :phone_number
      t.text :email

      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
