class WhishlistItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @whishlist_items = User.find( current_user ).wishlist_items
  end

end
