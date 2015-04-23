class StorehousesController < ApplicationController
	def new
		@storehouse = Storehouse.new
	end 
end
