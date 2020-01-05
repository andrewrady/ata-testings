class CreateTransactionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_items do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.integer :discount
      t.references :transactions, foreign_key: true

      t.timestamps
    end
  end
end
