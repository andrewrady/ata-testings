class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.references :testing, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :form
      t.integer :sparring
      t.integer :weapon
      t.integer :boardBreak
      t.integer :fit
      t.integer :total

      t.timestamps
    end
  end
end
