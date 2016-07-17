# TODO: Setup default room for every new user
class User < ApplicationRecord
  has_and_belongs_to_many :rooms
  
  validates :full_name, presence: true
  validates :username, presence: true
end
