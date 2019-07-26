class AddStudentToTesting < ActiveRecord::Migration[5.1]
  def change
    add_reference :testings, :student, foreign_key: true
    add_column :testings, :form, :integer
    add_column :testings, :sparring, :integer
    add_column :testings, :boardBreaks, :integer
    add_column :testings, :fit, :integer
    add_column :testings, :group, :string
  end
end
