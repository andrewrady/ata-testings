class CreateTestings < ActiveRecord::Migration[5.1]
  def change
    create_table :testings do |t|
      t.boolean :status
      t.string :location

      t.timestamps
    end
  end
end
