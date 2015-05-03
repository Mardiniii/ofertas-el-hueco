class Storehouses::ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_action :tent_only

	def new
		@article = Article.new
		5.times { @article.article_images.build }
	end
	
	def create		
		@article = Article.create(article_params)
		@storehouse = current_user.storehouse
		@article.storehouse_id = @storehouse.id
		if @article.save
  	  flash[:notice] = "El artículo #{@article.name} fue creado con exito"
  	  redirect_to storehouses_articles_path
  	else
  		flash[:alert] = "Ha ocurrido un error y el artículo #{@article.name}, no ha sido almacenado"
    	render :action => 'new'
  	end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to storehouses_articles_path
		else
			flash[:alert] = 'Se ha encontrado un error al intentar editar este producto'
			render 'edit'
		end
	end

	def index
		@storehouse = current_user.storehouse
		@articles = @storehouse.articles
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to storehouses_articles_path
	end

	private
		def article_params
  		params.require(:article).permit(:name, :code, :price, :details, :status, :subtitle, article_images_attributes: [:id,:caption,:image,:storehouse_id,:_destroy])
		end

		def tent_only
	    unless current_user.tent?
	      redirect_to root_path, :alert => "Lo sentimos, usted no es vendedor de articulos para acceder a esta ruta."
	    end
	  end
end