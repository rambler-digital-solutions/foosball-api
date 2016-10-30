class PlayerSerializer < ActiveModel::Serializer
  attributes :full_name, :email, :amplua

  delegate :user, to: :object
  delegate :full_name, :email, to: :user

  belongs_to :team_game
end
