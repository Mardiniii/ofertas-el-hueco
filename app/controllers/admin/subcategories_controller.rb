class Admin::SubcategoriesController < ApplicationController
  before_action :admin_only

  def index
    @subcategories = Subcategory.all
  end

  def new
    @subcategory = Subcategory.new
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      flash[:notice] = "La subcategoría #{@subcategory.name} fue creada con éxito"
      redirect_to admin_subcategories_path
    else
      flash[:alert] = "Hubo un problema y la subcategoría no ha sido guardada correctamente"
      render :action => :new
    end
  end

  def update
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.update(subcategory_params)
      flash[:notice] = "La subcategoría #{@subcategory.name} fue actualizada con éxito"
      redirect_to admin_subcategories_path
    else
      flash[:alert] = "Hubo un problema y la subcategoría no ha sido guardada correctamente"
      render :action => :edit
    end
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])

    @subcategory.destroy
    redirect_to admin_subcategories_path
  end

  def show_products
    @subcategory = Subcategory.find(params[:subcategory_id])
    @category = @subcategory.category
    @articles = @subcategory.articles
    if @articles.count > 0
      @articles = Article.paginate(:page => params[:page], :per_page => 12)
    else
      @articles = nil
    end
  end

  private
    def subcategory_params
      params.require(:subcategory).permit(:name, :category_id)
    end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
    end
  end

end