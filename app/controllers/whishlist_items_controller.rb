class WhishlistItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @whishlist_items = User.find( current_user ).wishlist_items
  end
  def destroy
    @whishlist_item = WishlistItem.find(params[:id])
    @whishlist_item.destroy

    redirect_to :back
  end

  def pepe
  end

end
