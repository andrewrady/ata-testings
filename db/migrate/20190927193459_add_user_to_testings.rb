class AddUserToTestings < ActiveRecord::Migration[5.1]
  def change
    add_reference :testings, :user, foreign_key: true
  end
end
