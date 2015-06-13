# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :articles
end
