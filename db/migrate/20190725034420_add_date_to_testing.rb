class AddDateToTesting < ActiveRecord::Migration[5.1]
  def change
    add_column :testings, :date, :datetime
  end
end
