class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.text :subject, null: false
      t.string :body
      t.references :contact, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
