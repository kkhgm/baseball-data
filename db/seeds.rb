# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

CSV.foreach("db/teams.csv") do |row|
     name = row[0]

  Enemy.create(name:name)
end

CSV.foreach("db/game_details.csv") do |row|
     game = row[0]
     get_score = row[1]
     lose = row[2]
     team_id = row[3]
     enemy = row[4]
     picher = row[5]
     doom_id = row[6]
     start_time = row[7]

  Game.create(team_id:team_id, game:game,get_score:get_score, lose:lose, enemy:enemy, picher:picher, doom_id:doom_id, start_time:start_time )
end

CSV.foreach("db/dooms.csv") do |row|
     name = row[0]
  Doom.create(name:name)
end
