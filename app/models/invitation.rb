class Invitation < ApplicationRecord
  has_many :games
  has_and_belongs_to_many :users

  # TODO: Auto generate token (and maybe link)
end
