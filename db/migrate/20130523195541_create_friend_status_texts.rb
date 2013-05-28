class CreateFriendStatusTexts < ActiveRecord::Migration
  def change
    create_table :friend_status_texts do |t|
      t.integer :friend_id, :null => false
      t.datetime :datetime_posted ,:null => false
      t.text :content

      t.timestamps
    end
  end
end
