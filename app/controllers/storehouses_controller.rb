class StorehousesController < ApplicationController
	def new
		@storehouse = Storehouse.new
	end 

	private
		def storehouse_params
  		params.require(:storehouse).permit(:name)
		end
end
