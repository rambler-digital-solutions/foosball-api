class CreateJoinTableGameUser < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true
      t.index [:user_id, :game_id]

      t.string :color
      t.string :amplua
      t.string :type # 2 player / 4 player game
    end

    remove_column :games, :team_1_forward_id
    remove_column :games, :team_1_defender_id
    remove_column :games, :team_2_forward_id
    remove_column :games, :team_2_defender_id
  end
end
