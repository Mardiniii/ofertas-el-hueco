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

require 'test_helper'

class WishlistItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
