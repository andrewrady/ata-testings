class AddCategoriesToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :categories, :text
  end
end
