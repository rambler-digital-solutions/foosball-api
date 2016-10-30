class TeamGame < ActiveRecord::Base
  belongs_to :game, inverse_of: :team_games
  has_many :players, inverse_of: :team_game

  accepts_nested_attributes_for :players
end
