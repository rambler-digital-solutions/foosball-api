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
    email: 'i.konyukhov@rambler-co.ru'
  },
  {
    full_name: 'Стас Цыганов',
    email: 's.tsyganov@rambler-co.ru'
  }
].map { |u| User.find_or_create_by(u) }

users.first.rooms = Room.where(name: :general)
users.second.rooms = Room.where(name: %i(general ios))

game = Game.create!(room: Room.first, score_a: 8, score_b: 0)
player1 = Player.create!(user: User.first, game: game, color: :white, amplua: :defender)
player1 = Player.create!(user: User.last, game: game, color: :red, amplua: :forward)
