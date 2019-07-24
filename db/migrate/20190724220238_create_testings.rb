class CreateTestings < ActiveRecord::Migration[5.1]
  def change
    create_table :testings do |t|
      t.boolean :status
      t.string :location
      t.references :groups, foreign_key: true

      t.timestamps
    end
  end
end
