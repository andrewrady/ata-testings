class ChangeTypeToIsPrimary < ActiveRecord::Migration[5.1]
  def change
    remove_column :email_addresses, :type
    add_column :email_addresses, :isPrimary, :boolean
  end
end
