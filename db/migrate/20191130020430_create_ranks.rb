class CreateRanks < ActiveRecord::Migration[5.1]
  def change
    create_table :ranks do |t|
      t.string :name
      t.integer :order
      t.references :student, foreign_key: true
      t.string :rankType

      t.timestamps
    end
  end
end
