class StorehousesController < ApplicationController
	def new
		@storehouse = Storehouse.new
	end 

	private
		def storehouse_params
  		params.require(:storehouse).permit(:name, :address, :description, :email, :telephone, :WhatsApp)
		end
end
