# == Schema Information
#
# Table name: storehouses
#
#  id                  :integer          not null, primary key
#  name                :string
#  address             :string
#  description         :text
#  email               :string
#  telephone           :string
#  whatsapp            :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Storehouse < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	belongs_to :user
	has_many :articles, dependent: :destroy
end
