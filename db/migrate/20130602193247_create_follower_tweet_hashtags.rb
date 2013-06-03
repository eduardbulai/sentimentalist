class CreateFollowerTweetHashtags < ActiveRecord::Migration
  def change
    create_table :follower_tweet_hashtags do |t|
      t.string :tag, :null => false
      t.integer :follower_tweet_id, :null => false

      t.timestamps
    end
  end
end
