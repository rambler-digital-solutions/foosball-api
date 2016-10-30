class GamesController < ApplicationController
  before_action :set_game, only: %i(show update destroy)

  def index
    render json: Game.all, include: ['teams', 'teams.players']
  end

  def create
    if @game = GameService.new(game_parameters).create!
      render json: @game, include: ['teams', 'teams.players'], status: :created
    else
      render json: @game.errors.as_json, status: :bad_request
    end
  end

  def show
    render json: @game, include: ['teams', 'teams.players']
  end

  def update
    if @game.update_attributes(game_parameters)
      render json: @game, include: ['teams', 'teams.players'], status: :ok
    else
      render json: @game.errors.as_json, status: :bad_request
    end
  end

  def destroy
    @game.destroy
    head :no_content
  end

  private

  def set_game
    @game ||= Game.find(params[:id])
  end

  def game_parameters
    params.require(:game)
      .permit(
        :invitation_id,
        :status,
        team_games_attributes: [
          :points,
          :color,
          players_attributes: [
            :user_id,
            :amplua
          ]
        ]
      )
  end
end
