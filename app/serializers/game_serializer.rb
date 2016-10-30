class GameSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :updated_at, :score

  belongs_to :room
  has_many :players

  def score
    [object.score_a, object.score_b]
  end
end
