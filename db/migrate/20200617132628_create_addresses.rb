class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :state
      t.integer :zip
      t.string :county
      t.string :type
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
