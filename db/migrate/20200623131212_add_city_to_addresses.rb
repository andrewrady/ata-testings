class AddCityToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :city, :string
  end
end
