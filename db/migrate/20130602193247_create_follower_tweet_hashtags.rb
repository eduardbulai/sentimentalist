class CreateFollowerTweetHashtags < ActiveRecord::Migration
  def change
    create_table :follower_tweet_hashtags do |t|
      t.string :tag
      t.integer :follower_tweet_id

      t.timestamps
    end
  end
end
