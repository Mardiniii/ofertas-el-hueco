# == Schema Information
#
# Table name: article_images
#
#  id         :integer          not null, primary key
#  article_id :integer
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArticleImage < ActiveRecord::Base
end
