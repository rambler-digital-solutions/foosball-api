# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { name: :general, public: true },
  { name: :ios, public: false }
].map { |r| Room.find_or_create_by(r) }

users = [
  {
    full_name: 'Илья Конюхов',
    username: 'runfor'
  },
  {
    full_name: 'Стас Цыганов',
    username: 's.tsyganov'
  }
].map { |u| User.find_or_create_by(u) }

users.first.rooms << Room.where(name: :general)
users.second.rooms = Room.where(name: %i(general ios))
