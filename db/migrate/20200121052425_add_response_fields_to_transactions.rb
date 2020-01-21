class AddResponseFieldsToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :isPartial, :boolean
    add_column :transactions, :partialId, :string
    add_column :transactions, :originalFullAmount, :float
    add_column :transactions, :partialAmountApproved, :float
    add_column :transactions, :avsResponse, :string
    add_column :transactions, :css2Response, :string
    add_column :transactions, :cardType, :string
    add_column :transactions, :last4, :string
    add_column :transactions, :maskedPan, :string
    add_column :transactions, :token, :string
    add_column :transactions, :action, :string
    add_column :transactions, :isError, :boolean
    add_column :transactions, :isSuccess, :boolean
  end
end
