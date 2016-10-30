class BootstrapFoosballApiSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.boolean :is_public, default: true
      t.boolean :is_default, default: false

      t.timestamps
    end

    create_join_table :users, :rooms do |t|
      t.index [:user_id, :room_id]

      t.timestamps
    end

    create_table :users do |t|
      t.string :full_name, null: false
      t.string :email, null: false

      t.timestamps
    end

    create_table :players do |t|
      t.integer :user_id, index: true
      t.integer :team_game_id
      t.string :amplua

      t.timestamps
    end

    create_table :team_games do |t|
      t.integer :game_id
      t.integer :points
      t.string :color

      t.timestamps
    end

    create_table :games do |t|
      t.integer :invitation_id
      t.string :status

      t.timestamps
    end

    create_table :invitations do |t|
      t.string :message
      t.string :token

      t.timestamps
    end

    create_join_table :users, :invitations
  end
end
