class DropHashtagTables < ActiveRecord::Migration
  def up
    drop_table :user_tweet_hashtags
    drop_table :follower_tweet_hashtags
  end

  def down
    create_table :follower_tweet_hashtags do |t|
      t.string :tag
      t.integer :follower_tweet_id

      t.timestamps
    end
    create_table :user_tweet_hashtags do |t|
      t.string :tag, :null => false
      t.integer :user_tweet_id, :null => false

      t.timestamps
    end
  end
end
