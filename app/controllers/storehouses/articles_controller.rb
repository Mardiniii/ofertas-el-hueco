class Storehouses::ArticlesController < ApplicationController
	before_action :authenticate_user!, :except => [:show,:bindstore]
	before_action :admin_or_tent_only?, :except => [:show,:bindstore, :article_info]
	respond_to :html, :json

	def new
		@article = Article.new
		@article.article_images.build
	end

	def create
		puts "~~~~~~~~~~~~~~~~"
		puts params
		puts "~~~~~~~~~~~~~~~~"
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
    respond_with @article do |format|
      format.json { render :layout => false, :text => @article.to_json }
    end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			if current_user.admin?
				redirect_to admin_article_list_path
			else
				redirect_to storehouses_articles_path
			end
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

	def bindstore
    @bindstore = Article.find(params[:article_id]).storehouse
   	respond_with @bindstore do |format|
    	format.json { render :layout => false, :text => @bindstore.to_json }
  	end
  end

	private
		def article_params
  		params.require(:article).permit(:name, :code, :price, :details, :status, :subtitle, :subcategory_id, article_images_attributes: [:id,:caption,:image,:storehouse_id,:_destroy])
		end

		def admin_or_tent_only?
	    unless current_user.tent? || current_user.admin?
	      redirect_to root_path, :alert => "Lo sentimos, usted no es vendedor de articulos para acceder a esta ruta."
	    end
	  end
end
