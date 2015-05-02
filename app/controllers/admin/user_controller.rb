class Admin::UserController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_only

	def new
		@user = User.new
		storehouse = @user.storehouses.build
	end 

	def create
  	@user = User.new(user_params)
  	@user.role = "tent"
	  if @user.save
  	  flash[:notice] = "El usuario #{@user.email} fue creado con exito"
  	  redirect_to user_index_path
  	else
  		flash[:alert] = "Ha ocurrido un error y el usuario #{@user.email}, no ha sido almacenado"
    	render :action => 'new'
  	end
	end

	def index
		@storehouses = Storehouse.all
	end

	private
		def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation, storehouses_attributes: [:id,:name,:address,:avatar,:description,:email,:telephone,:user_id,:whatsapp,:_destroy])
		end
		
		def admin_only
	    unless current_user.admin?
	      redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
	    end
	  end
end
