class StorehousesController < ApplicationController
	include ApplicationHelper

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
end
