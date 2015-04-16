class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
