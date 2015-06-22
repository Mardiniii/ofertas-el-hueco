class WhishlistItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @whishlist_items = User.find( current_user ).wishlist_items
  end
  def create
    @whishlist_item = WishlistItem.new()
    @whishlist_item.article_id = params[:whishlist_item_id]
    @whishlist_item.user_id = current_user.id
    @whishlist_item.save
    redirect_to :back
    rescue ActionController::RedirectBackError
    redirect_to root_path
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
