class Room < ApplicationRecord
  has_and_belongs_to_many :users

  scope :public_rooms, ->() { where(is_public: true) }

  validates :name, presence: true
  validates :is_public, presence: true
end
