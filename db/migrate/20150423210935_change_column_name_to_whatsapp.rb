class ChangeColumnNameToWhatsapp < ActiveRecord::Migration
  def change
  	rename_column :storehouses, :WhatsApp, :whatsapp
  end
end
