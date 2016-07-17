class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :rooms do |t|
      t.index :user_id
      t.index :room_id

      t.timestamps
    end

    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.boolean :public

      t.timestamps
    end
  end
end
