# == Schema Information
#
# Table name: wishlist_items
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WishlistItem < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
end
