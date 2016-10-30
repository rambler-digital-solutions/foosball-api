class RenamePlayerFields < ActiveRecord::Migration[5.0]
  def change
    rename_column :games, :attacker_a_id, :team_1_forward_id
    rename_column :games, :defender_a_id, :team_1_defender_id
    rename_column :games, :attacker_b_id, :team_2_forward_id
    rename_column :games, :defender_b_id, :team_2_defender_id
  end
end
