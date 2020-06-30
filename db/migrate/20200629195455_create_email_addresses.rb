class CreateEmailAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :email_addresses do |t|
      t.string :email
      t.string :type

      t.timestamps
    end
  end
end
