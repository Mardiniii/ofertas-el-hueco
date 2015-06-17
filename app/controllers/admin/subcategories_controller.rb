class Admin::SubcategoriesController < ApplicationController

  def index
    @subcategories = Subcategory.all
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      flash[:notice] = "La subcategoría #{@subcategory.name} fue creada con éxito"
      redirect_to root_path
    else
      flash[:alert] = "Hubo un problema y la subcategoría no ha sido guardada correctamente"
      render :action => :new
    end
  end

  private
  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end

end