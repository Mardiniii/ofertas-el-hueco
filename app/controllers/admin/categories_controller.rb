class Admin::CategoriesController < ApplicationController

  def index

  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "La categoría #{@category.name} fue creada con éxito"
      redirect_to root_path
    else
      flash[:alert] = "Ha ocurrido un error y la categoría no ha sido almacenada"
      render :action => 'new'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end


end
