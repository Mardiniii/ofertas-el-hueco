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

class Article < ActiveRecord::Base
	belongs_to :storehouse
  belongs_to :subcategory
  has_many :wishlist_items, dependent: :destroy
  has_and_belongs_to_many :subcategories
  has_many :article_images, dependent: :destroy
  accepts_nested_attributes_for :article_images, :limit => 5, :reject_if => :all_blank, allow_destroy: true
  validates_associated :article_images
  validates :name, :subcategory, :status, :code, :price, :details, :subtitle, presence: true

  def image
    ArticleImage.where(article_id: self.id).first.image.url
  end

  def price_with_coma
     ActionController::Base.helpers.number_with_delimiter(self.price, :delimiter => ',')
  end

  def as_json(options = { })
    # just in case someone says as_json(nil) and bypasses
    # our default...
    super((options || { }).merge({
      :methods => [:image, :price_with_coma]
      }))
  end
end
