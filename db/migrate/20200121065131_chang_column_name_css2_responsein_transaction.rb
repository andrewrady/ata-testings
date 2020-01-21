class ChangColumnNameCss2ResponseinTransaction < ActiveRecord::Migration[5.1]
  def change
    rename_column :transactions, :css2Response, :cvv2Response
  end
end
