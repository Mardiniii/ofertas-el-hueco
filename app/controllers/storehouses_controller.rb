class StorehousesController < ApplicationController
	def show
		puts "****************"
		puts "#{params}"
		puts "****************"
		@storehouse = Storehouse.find(params[:id])
		if params[:subcategory_id]
			@articles = Article.where(subcategory_id: params[:subcategory_id],storehouse_id: @storehouse.id)		
		end
	end
end
