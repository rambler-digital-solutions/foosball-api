class AddScoreToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :score_a, :integer
    add_column :games, :score_b, :integer
    add_column :games, :status, :string
  end
end
