class WhishlistItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @whishlist_items = User.find( current_user ).wishlist_items
  end
  def create

    if WishlistItem.where(user_id: current_user.id, article_id: params[:whishlist_item_id]).empty?
      @whishlist_item = WishlistItem.new()
      @whishlist_item.article_id = params[:whishlist_item_id]
      @whishlist_item.user_id = current_user.id
      @whishlist_item.save
      flash[:notice] = "Se ha agregado el producto"
    else
      flash[:alert] = "Ya agregaste este producto a tu lista"
    end
    redirect_to :back
    rescue ActionController::RedirectBackError
    redirect_to :whishlist_items
  end
  def destroy
    @whishlist_item = WishlistItem.find(params[:id])
    @whishlist_item.destroy
    redirect_to :back
    rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  private
  def whishlist_item_params
    params.require(:article).permit(:article_id)
  end

end
