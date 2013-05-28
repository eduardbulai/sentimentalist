class CreateFriendStatusTexts < ActiveRecord::Migration
  def change
    create_table :friend_status_texts do |t|
      t.integer :friend_id, :NULL => false
      t.datetime :datetime_posted ,:NULL => false
      t.text :content

      t.timestamps
    end
  end
end
