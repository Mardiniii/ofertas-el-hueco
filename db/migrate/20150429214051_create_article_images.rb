class CreateArticleImages < ActiveRecord::Migration
  def change
    create_table :article_images do |t|
      t.integer :article_id
      t.text :url

      t.timestamps null: false
    end
  end
end
