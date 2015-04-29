# == Schema Information
#
# Table name: articles
#
#  id            :integer          not null, primary key
#  storehouse_id :integer
#  name          :string
#  code          :string
#  price         :integer
#  details       :text
#  status        :boolean
#  subtitle      :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Article < ActiveRecord::Base
	belongs_to :storehouse
	has_many :article_images
	accepts_nested_attributes_for :article_images, :limit => 5, :reject_if => :all_blank, allow_destroy: true
  validates_associated :article_images
end
