class AddFirstNameLastNameRankToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :firstName, :string
    add_column :participants, :lastName, :string
    add_column :participants, :rank, :string
  end
end
