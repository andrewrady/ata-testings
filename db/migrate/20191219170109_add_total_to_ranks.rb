class AddTotalToRanks < ActiveRecord::Migration[5.1]
  def change
    add_column :ranks, :total, :integer
  end
end
