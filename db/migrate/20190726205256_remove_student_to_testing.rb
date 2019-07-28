class RemoveStudentToTesting < ActiveRecord::Migration[5.1]
  def change
    remove_reference :testings, :student, foreign_key: true
    remove_column :testings, :form, :integer
    remove_column :testings, :sparring, :integer
    remove_column :testings, :boardBreaks, :integer
    remove_column :testings, :fit, :integer
    remove_column :testings, :group, :string
  end
end
