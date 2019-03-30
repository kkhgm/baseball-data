class TeamController < ApplicationController

  def index
    @label = 125.times.map {|t| t +1}

    @teams = Team.all.includes(:games)
    set_team_data

    @compare_get_amount = @teams.map{|m| m.games.sum(:get_score)}
    @compare_lose_amount = @teams.map{|m| m.games.sum(:lose)}
  end

  def show
    @team_datas = Team.find(params[:id]).games.includes(:doom).includes(:enemy)
    @label = 125.times.map {|t| t +1}

    @win_amount = @team_datas.where("game = 1").group(:enemy_id).sum(:game)
    @avg_score = @team_datas.where("game = 1").group(:enemy_id).average(:get_score)
    @enemy_names = @team_datas.group(:enemy_id)
    set_team_data

    # 各チームを選択し紐づく勝敗配列（game）を取得
    #チームの勝敗を計算
    @scores = @team_datas.map {|team| team.get_score - team.lose}

    # ドーム別勝敗を確認
    @doom_datas = @team_datas.where("game = 1").group(:doom_id).includes(:doom)
  end

  def set_team_data
    tigers = Team.find(1).games
    @tigers = set_amount(tigers)
    swallows = Team.find(2).games
    @swallows = set_amount(swallows)
    giants = Team.find(3).games
    @giants = set_amount(giants)
    dragons = Team.find(4).games
    @dragons = set_amount(dragons)
    dena = Team.find(5).games
    @dena = set_amount(dena)
    carps = Team.find(6).games
    @carps = set_amount(carps)
  end

  def set_amount(games)
      score = []
      @amount = []

      games.each do |game|
       score << game.game
       @amount << score.sum
      end
     return @amount
  end
end
