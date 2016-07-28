class AddRegistrationCodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :confirmation_code, :string
    add_column :users, :email_confirmed, :boolean, default: false
  end
end
