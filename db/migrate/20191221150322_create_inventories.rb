class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.float :price
      t.float :cost
      t.integer :amount
      t.string :distributor
      t.references :user

      t.timestamps
    end
  end
end
