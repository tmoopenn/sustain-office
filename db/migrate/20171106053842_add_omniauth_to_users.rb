class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :email, :string
    add_column :users, :password, :string
    remove_column :users, :last
    rename_column :users, :first, :name
  end
end
