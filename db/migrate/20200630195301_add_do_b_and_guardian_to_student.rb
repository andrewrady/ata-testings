class AddDoBAndGuardianToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :dateOfBirth, :datetime
    add_column :students, :guardianFirstName, :string
    add_column :students, :guardianLastName, :string
  end
end
