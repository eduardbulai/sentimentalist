class AddNullConstraintsToUsersTable < ActiveRecord::Migration

  def up
    change_table :users do |t|
      t.change :name, :string, null: false
      t.change :twitter_handle, :string, null: false
      t.change :provider, :string, null: false
      t.change :uid, :string, null: false
      t.change :oauth_token, :string, null: false
      t.change :oauth_secret, :string, null: false
    end
  end

  def down
    change_table :users do |t|
      t.change :oauth_secret, :string, null: true
      t.change :oauth_token, :string, null: true
      t.change :uid, :string, null: true
      t.change :provider, :string, null: true
      t.change :twitter_handle, :string, null: true
      t.change :name, :string, null: true
    end
  end

end
