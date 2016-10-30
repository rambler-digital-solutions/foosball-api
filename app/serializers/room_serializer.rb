class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_public, :is_default, :created_at, :updated_at

  has_many :users
end
