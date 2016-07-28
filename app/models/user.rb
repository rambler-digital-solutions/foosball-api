# TODO: Setup default room for every new user
class User < ApplicationRecord
  has_and_belongs_to_many :rooms
  
  validates :full_name, presence: true, if: %i(confirmed? password_changed?)
  validates :email,
    presence: true,
    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  def confirm_email!
    update_attributes(email_confirmed: true)
  end

  def confirmed?
    email_confirmed
  end

  def password_changed?
    # TODO: Implement when authentication mechanism were added
    true
  end
end
