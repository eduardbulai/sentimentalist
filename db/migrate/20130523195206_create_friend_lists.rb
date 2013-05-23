class CreateFriendLists < ActiveRecord::Migration
  def change
    create_table :friend_lists do |t|
      t.integer :id
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
