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
end
