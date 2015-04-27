# == Schema Information
#
# Table name: storehouses
#
#  id          :integer          not null, primary key
#  name        :string
#  address     :string
#  description :text
#  email       :string
#  telephone   :string
#  whatsapp    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Storehouse < ActiveRecord::Base
	belongs_to :user
end
