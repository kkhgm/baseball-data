class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :team_id
      t.integer :game
      t.integer :get
      t.integer :lose
      t.integer :enemy
      t.string :picher
      t.integer :doom_id
      t.string :start_time
      t.timestamps
    end
  end
end

