class AddUserIdColumnToStorehouses < ActiveRecord::Migration
  def change
  	add_column :storehouses, :user_id, :integer
  end
end
