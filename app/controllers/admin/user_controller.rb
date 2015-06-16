class Admin::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

	def index
		@storehouses = Storehouse.all
	end

  def show
    @user = User.find(params[:id])
    @storehouse = @user.storehouse
  end

  def new
    @user = User.new
    @user.build_storehouse
  end

  def create
    @user = User.new(user_params)
    @user.role = "tent"
    if @user.save
      flash[:notice] = "El usuario #{@user.email} fue creado con éxito"
      redirect_to admin_user_index_path
    else
      flash[:alert] = "Ha ocurrido un error y el usuario #{@user.email}, no ha sido almacenado"
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "El usuario #{@user.email} fue actualizado con éxito"
      redirect_to admin_user_index_path
    else
      flash[:alert] = "Ha ocurrido un error y el usuario #{@user.email}, no ha sido almacenado"
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_index_path
  end

	# Metodo para listar todos los usuarios de la plataforma
	def user_index
		puts "#{params[:user]} - #{params[:tent]} - #{params[:admin]}!!!!!!!!!!!!!!!!!!!!!!!!!!"
		# Filtro para seleccion un rol especifico de usuarios
		if params[:user].present?			
		  @users = User.where(role: 0)
		elsif params[:tent].present?
		  @users = User.where(role: 1)
		elsif params[:admin].present?
		  @users = User.where(role: 2)
		else
			#Bandera para mostrar lista vacia
			@vacio = true
		end
	end

	def article_index
		@articles = Article.all
	end

	private
		def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation, storehouse_attributes: [:id,:name,:address,:avatar,:description,:email,:telephone,:user_id,:whatsapp,:_destroy])
		end

		def admin_only
	    unless current_user.admin?
	      redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
	    end
	  end
end
