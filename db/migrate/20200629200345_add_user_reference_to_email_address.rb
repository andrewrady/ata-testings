class AddUserReferenceToEmailAddress < ActiveRecord::Migration[5.1]
  def change
    add_reference :email_addresses, :student, foreign_key: true
  end
end
