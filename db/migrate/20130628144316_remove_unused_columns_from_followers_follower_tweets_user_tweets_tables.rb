class RemoveUnusedColumnsFromFollowersFollowerTweetsUserTweetsTables < ActiveRecord::Migration
  def up
    remove_column :followers, :location
    remove_column :follower_tweets, :datetime_tweeted
    remove_column :user_tweets, :datetime_tweeted
  end

  def down
    add_column :user_tweets, :datetime_tweeted, :datetime
    add_column :follower_tweets, :datetime_tweeted, :datetime
    add_column :followers, :location, :string
  end
end
