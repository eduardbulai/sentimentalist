class AddEmotionToFollowerTweets < ActiveRecord::Migration
  def up
  	add_column :follower_tweets, :emotion, :string
  end

  def down
  	remove_column :follower_tweets, :emotion
  end
end
