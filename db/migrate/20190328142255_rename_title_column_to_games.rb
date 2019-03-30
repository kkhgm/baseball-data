class RenameTitleColumnToGames < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :enemy, :enemy_id
    rename_column :games, :get, :get_score
  end
end
