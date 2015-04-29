# == Schema Information
#
# Table name: article_images
#
#  id         :integer          not null, primary key
#  article_id :integer
#  caption    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ArticleImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
