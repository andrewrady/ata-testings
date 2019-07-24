class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :title
      t.references :testings, foreign_key: true
      t.datetime :time

      t.timestamps
    end
  end
end
