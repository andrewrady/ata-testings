class AddSizeToParticipant < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :size, :integer
  end
end
