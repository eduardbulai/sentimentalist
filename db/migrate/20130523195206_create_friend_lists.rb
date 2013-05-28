class CreateFriendLists < ActiveRecord::Migration
  def change
    create_table :friend_lists do |t|
      t.string :name, :NULL => false
      t.integer :user_id, :NULL => false

      t.timestamps
    end
  end
end
