class AddPolarityToFollowerTweets < ActiveRecord::Migration
  def up
  	add_column :follower_tweets, :polarity, :integer
  end

  def down
  	remove_column :follower_tweets, :polarity
  end
end
