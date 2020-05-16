class RemoveOldColumnAndAddTaxToTransactionItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :transaction_items, :discount
    remove_column :transaction_items, :quantity
    add_column :transaction_items, :tax, :boolean
  end
end
