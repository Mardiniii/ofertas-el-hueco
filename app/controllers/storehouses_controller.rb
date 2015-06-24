class StorehousesController < ApplicationController
	include ApplicationHelper
  respond_to :html, :json

	def show
		@store_visit = false
		@storehouse = Storehouse.find(params[:id])
		@category_hash = storehouse_categories(@storehouse)
		if params[:subcategory_id]
			@subcategory = Subcategory.find(params[:subcategory_id])
			@category = @subcategory.category
			@articles = Article.where(subcategory_id: params[:subcategory_id],storehouse_id: @storehouse.id)
			if @articles.count > 0
	      @articles = @articles.paginate(:page => params[:page], :per_page => 12)
	    else
	      @articles = nil
	    end
		else
			@store_visit = true
		end
	end

  def favorite_articles
    @favorite_articles = []
    @storehouse = current_user.storehouse
    @storehouse.articles.each do |article|
      if article.wishlist_items.count > 0
        @favorite_articles.push([article, article.wishlist_items.count])
      end
    end
    @favorite_articles = @favorite_articles.sort {|a,b| b[1] <=> a[1]}
  end

  def favorite_clients
    response = params
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts params
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
    clients_array = []
    article = Article.find(params[:article])
    article.wishlist_items.each do |item|
      clients_array.push(item.user.email)
    end
    render :json => {article: clients_array}
  end
end
