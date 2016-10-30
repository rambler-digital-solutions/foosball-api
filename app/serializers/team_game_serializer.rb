class TeamGameSerializer < ActiveModel::Serializer
  attributes :points, :color

  has_many :players
end
