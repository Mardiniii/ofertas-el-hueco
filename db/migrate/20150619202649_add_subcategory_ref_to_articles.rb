class AddSubcategoryRefToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :subcategory, index: true
    add_foreign_key :articles, :subcategories
  end
end
