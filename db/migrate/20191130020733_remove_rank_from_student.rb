class RemoveRankFromStudent < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :rank
  end
end
