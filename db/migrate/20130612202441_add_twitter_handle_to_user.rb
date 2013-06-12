class AddTwitterHandleToUser < ActiveRecord::Migration
  def up
  	add_column :users, :twitter_handle, :string
  end

  def down
  	remove_column :users, :twitter_handle
  end
end
