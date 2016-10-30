class GamesController < ApplicationController
  before_action :set_game, only: %i(show update destroy)

  def index
    render json: Game.all
  end

  def create
    if @game = GameService.create(game_parameters)
      render json: @game, status: :created
    else
      render json: @game.errors.as_json, status: :bad_request
    end
  end

  def show
    render json: @game
  end

  def update
    if @game.update_attributes(game_parameters)
      render json: @game, status: :ok
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
      .permit(:invitation_id, :status, teams: [:score, :color, players: [:user_id, :amplua]])
  end
end
