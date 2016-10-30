class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :public, :default, :created_at, :updated_at

  has_many :games
end
