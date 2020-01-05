class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.float :total
      t.boolean :tax
      t.float :discount
      t.string :authResponse
      t.string :authCode
      t.string :referenceNumber
      t.string :orderId

      t.timestamps
    end
  end
end
