class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :storehouse_id
      t.string :name
      t.string :code
      t.integer :price
      t.text :details
      t.boolean :status
      t.text :subtitle

      t.timestamps null: false
    end
  end
end
