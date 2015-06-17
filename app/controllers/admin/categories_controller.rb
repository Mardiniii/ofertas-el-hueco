class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "La categoría #{@category.name} fue creada con éxito"
      redirect_to admin_categories_path
    else
      flash[:alert] = "Ha ocurrido un error y la categoría no ha sido almacenada"
      render :action => 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "La categoría #{@category.name} fue actualizada con éxito"
      redirect_to admin_categories_path
    else
      flash[:alert] = "Ha ocurrido un error y la categoría no ha sido almacenada"
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end


end
