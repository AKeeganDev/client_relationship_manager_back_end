class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :username, null: false

      t.timestamps
    end
  end
end
