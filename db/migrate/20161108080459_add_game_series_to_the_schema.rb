class AddGameSeriesToTheSchema < ActiveRecord::Migration[5.0]
  def change
    drop_table :invitations
    drop_table :invitations_users

    create_table :series do |t|
      t.timestamps
    end

    create_join_table :series, :users

    rename_column :games, :invitation_id, :series_id
  end
end
