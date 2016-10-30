# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { name: :general, is_public: true },
  { name: :ios, is_public: false }
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

invite = Invitation.create!(message: 'Давайте соберем прокрут!', users: users)

game = Game.create!(invitation: invite, status: :active)

team_game1 = TeamGame.create(points: 7, game: game, color: :red)
team_game2 = TeamGame.create(points: 0, game: game, color: :white)

player1 = Player.create!(user: User.first, team_game: team_game1, amplua: :defender)
player1 = Player.create!(user: User.last, team_game: team_game2, amplua: :forward)
