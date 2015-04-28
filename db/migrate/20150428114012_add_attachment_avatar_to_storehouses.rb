class AddAttachmentAvatarToStorehouses < ActiveRecord::Migration
  def self.up
    change_table :storehouses do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :storehouses, :avatar
  end
end
