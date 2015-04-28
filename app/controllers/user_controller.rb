class UserController < ApplicationController
	before_action :authenticate_user!

	def new
		@user = User.new
	end 

	def create
  	@user = User.new(user_params)
  	@user.course_ids = params[:user][:course_ids] 
	  if @user.save
	  	UserMailer.welcome_email(@user).deliver_now
  	  flash[:notice] = "El usuario #{@user.email} fue creado con exito"
  	  redirect_to user_index_path
  	else
  		flash[:alert] = "Ha ocurrido un error y el usuario #{@user.email}, no ha sido almacenado"
    	render :action => 'new'
  	end
	end

	private
		def user_params
  		params.require(:user).permit(:email, :role, :password, :password_confirmation)
		end
		
		def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
    end
  end
end
