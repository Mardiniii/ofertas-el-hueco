class StorehousesController < ApplicationController
	before_action :authenticate_user!
	before_filter :admin_only

	def new
		@storehouse = Storehouse.new
	end 

	def create
  	@storehouse = Storehouse.new(storehouse_params)
	  if @storehouse.save	  	
  	  flash[:notice] = "La tienda #{@storehouse.name} fue creada con exito"
  	  redirect_to storehouse_path
  	else
  		flash[:alert] = "Ha ocurrido un error y la tienda #{@storehouse.name}, no ha sido almacenada"
    	render :action => 'new'
  	end
	end

	def index
		@storehouses = Storehouse.all
	end

	private
		def storehouse_params
  		params.require(:storehouse).permit(:name, :address, :description, :email, :telephone, :whatsapp, storehouses_attributes: [:id,:name,:address,:description,:email,:telephone,:user_id,:whatsapp,:_destroy])
		end

		def admin_only
	    unless current_user.admin?
	      redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
	    end
	  end
end