class AddTaxToInventories < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :tax, :Boolean
  end
end
