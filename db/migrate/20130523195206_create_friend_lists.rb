class CreateFriendLists < ActiveRecord::Migration
  def change
    create_table :friend_lists do |t|
      t.string :name, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
