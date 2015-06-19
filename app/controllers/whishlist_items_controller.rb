class WhishlistItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @whishlist_items = User.find( current_user ).wishlist_items
  end
  def nav_list
    @whishlist_items = User.find( current_user ).wishlist_items.limit(5)
  end
end
