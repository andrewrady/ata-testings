class AddUserToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :student, foreign_key: true
  end
end
