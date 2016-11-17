# TODO: Setup default room for every new user
class User < ApplicationRecord
  has_many :players, inverse_of: :users
  has_many :team_games, through: :players
  has_many :games, through: :team_games
  has_and_belongs_to_many :rooms
  has_and_belongs_to_many :series

  validates :full_name, presence: true
  validates :email,
    presence: true,
    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
end
