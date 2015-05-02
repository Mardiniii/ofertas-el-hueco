# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :integer
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://i592.photobucket.com/albums/tt5/Mardini03/765-default-avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_one :storehouse, dependent: :destroy
  enum role: [ :user, :tent, :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  accepts_nested_attributes_for :storehouse, :reject_if => :all_blank, allow_destroy: true
  validates_associated :storehouse
	
	after_initialize :set_default_role, :if => :new_record?
	def set_default_role
    self.role ||= :user
  end         
end
