# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  storehouse_id  :integer
#  name           :string
#  code           :string
#  price          :integer
#  details        :text
#  status         :boolean
#  subtitle       :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subcategory_id :integer
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
