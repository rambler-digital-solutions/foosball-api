class Player < ActiveRecord::Base
  belongs_to :team_game, inverse_of: :players
  belongs_to :user, inverse_of: :players
end
