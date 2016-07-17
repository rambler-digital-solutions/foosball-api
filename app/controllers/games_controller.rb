class GamesController < ApplicationController
  before_action :set_game, on: %i(show update destroy)

  def create
    Game.create(game_parameters)
  end

  def show
    render json: @game
  end

  def update
    @game.update_attributes(game_parameters)
  end

  def destroy
    @game.destroy
  end

  private

  def set_game
    @game ||= Game.find(params[:id])
  end

  def game_parameters
    params.require(:game)
      .permit([
        :attacker_a_id,
        :attacker_b_id,
        :defender_a_id,
        :defender_b_id,
        :room_id,
      ])
  end
end
