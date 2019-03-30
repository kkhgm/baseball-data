class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :team_id, foreign_key: true
      t.integer :game
      t.integer :get_score
      t.integer :lose
      t.integer :enemy_id, foreign_key: true
      t.string :picher
      t.integer :doom_id, foreign_key: true
      t.string :start_time
      t.timestamps
    end
  end
end

