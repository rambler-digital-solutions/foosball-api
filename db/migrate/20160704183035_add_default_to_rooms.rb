class AddDefaultToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :default, :boolean, default: false
  end
end
