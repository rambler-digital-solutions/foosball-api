class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :attacker_a_id
      t.integer :defender_a_id
      t.integer :attacker_b_id
      t.integer :defender_b_id
      t.integer :room_id, index: true

      t.timestamps
    end
  end
end
