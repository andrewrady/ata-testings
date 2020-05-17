class RenameTransactionToPosRecord < ActiveRecord::Migration[5.1]
  def change
    rename_table :transactions, :pos_records
    rename_table :transaction_items, :pos_records_items
  end
end
