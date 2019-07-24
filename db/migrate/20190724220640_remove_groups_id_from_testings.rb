class RemoveGroupsIdFromTestings < ActiveRecord::Migration[5.1]
  def change
    remove_column :testings, :groups_id, :integer
  end
end
