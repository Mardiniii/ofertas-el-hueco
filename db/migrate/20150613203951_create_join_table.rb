class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :subcategories, :articles do |t|
      t.index [:subcategory_id, :article_id]
      t.index [:article_id, :subcategory_id]
    end
  end
end
