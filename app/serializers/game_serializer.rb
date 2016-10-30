class GameSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :updated_at, :invitation_id

  has_many :team_games, key: :teams
end
