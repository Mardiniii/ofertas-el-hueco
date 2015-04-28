class CreateStorehouses < ActiveRecord::Migration
  def change
    create_table :storehouses do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :email
      t.string :telephone
      t.string :WhatsApp

      t.timestamps null: false
    end
  end
end
