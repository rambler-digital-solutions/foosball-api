class Game < ApplicationRecord
  has_many :players
  belongs_to :room

  # validates :players, presence: true
  # validates :room, presence: true
  # validates :status, inclusion: 

  # TODO: Add validation that one user cant play on both sides
end
