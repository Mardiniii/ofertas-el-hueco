class ChangeNameToUrlColumnInArticleImagesTable < ActiveRecord::Migration
  def change
  	rename_column :article_images, :url, :caption
  end
end
