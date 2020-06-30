class AddWeaverAndDateToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :waiver, :boolean
    add_column :students, :signedDate, :datetime
  end
end
