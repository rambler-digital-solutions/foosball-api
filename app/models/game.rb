class Game < ApplicationRecord
  belongs_to :attacker_a, class_name: 'User'
  belongs_to :defender_a, class_name: 'User'
  belongs_to :attacker_b, class_name: 'User'
  belongs_to :defender_b, class_name: 'User'
  belongs_to :room

  validates :attacker_a, presence: true
  validates :defender_a, presence: true
  validates :attacker_b, presence: true
  validates :defender_b, presence: true
  validates :room, presence: true
  # validates :status, inclusion: 

  # TODO: Add validation that one user cant play on both sides
end
