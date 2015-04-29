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

class ArticleImage < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	belongs_to :article
end
