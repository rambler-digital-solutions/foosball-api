class Game < ApplicationRecord
  belongs_to :invitation
  has_many :team_games, inverse_of: :game
  has_many :players, through: :team_games

  accepts_nested_attributes_for :team_games

  # validates :players, presence: true
  # validates :room, presence: true
  # validates :status, inclusion: 

  # TODO: Add validation that one user cant play on both sides
end
