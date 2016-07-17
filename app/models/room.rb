class Room < ApplicationRecord
  has_and_belongs_to_many :users

  scope :public_rooms, ->() { where(public: true) }

  validates :name, presence: true
  validates :public, presence: true
end
