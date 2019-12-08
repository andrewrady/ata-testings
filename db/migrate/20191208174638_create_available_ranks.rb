class CreateAvailableRanks < ActiveRecord::Migration[5.1]
  def change
    create_table :available_ranks do |t|
      t.string :name
      t.integer :order
      t.string :rankType

      t.timestamps
    end
  end
end
