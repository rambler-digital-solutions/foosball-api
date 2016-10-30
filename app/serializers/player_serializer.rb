class PlayerSerializer < ActiveModel::Serializer
  attributes :full_name, :email, :color, :amplua

  delegate :user, to: :object
  delegate :full_name, :email, to: :user
end
