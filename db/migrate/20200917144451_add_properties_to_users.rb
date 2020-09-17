class AddPropertiesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :twitter_uid, :string
    add_column :users, :password_digest, :string
  end
end
