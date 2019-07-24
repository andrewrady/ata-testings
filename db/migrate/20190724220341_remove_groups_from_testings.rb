class RemoveGroupsFromTestings < ActiveRecord::Migration[5.1]
  def change
    remove_column :testings, :group_id, :integer
  end
end
