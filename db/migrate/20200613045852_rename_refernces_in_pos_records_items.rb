class RenameReferncesInPosRecordsItems < ActiveRecord::Migration[5.1]
  def change
    remove_reference :pos_records_items, :transactions
    add_reference :pos_records_items, :pos_records, foreign_key: true
  end
end
