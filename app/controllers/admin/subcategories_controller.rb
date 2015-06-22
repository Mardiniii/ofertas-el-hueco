class Admin::SubcategoriesController < ApplicationController

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
    
  end

  private
    def subcategory_params
      params.require(:subcategory).permit(:name, :category_id)
    end
end