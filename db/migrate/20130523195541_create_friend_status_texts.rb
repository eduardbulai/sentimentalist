class CreateFriendStatusTexts < ActiveRecord::Migration
  def change
    create_table :friend_status_texts do |t|
      t.integer :id
      t.integer :friend_id
      t.datetime :datetime_posted
      t.text :content

      t.timestamps
    end
  end
end
