class PagesController < ApplicationController
	def home
		@storehouses = Storehouse.all		
	end

	def about_us
	end
end
