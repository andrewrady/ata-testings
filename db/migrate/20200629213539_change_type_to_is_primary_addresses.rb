class ChangeTypeToIsPrimaryAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :type
    add_column :addresses, :isPrimary, :boolean
  end
end
