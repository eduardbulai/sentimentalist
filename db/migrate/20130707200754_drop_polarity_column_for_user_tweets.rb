class DropPolarityColumnForUserTweets < ActiveRecord::Migration
  def up
    remove_column :user_tweets, :polarity
  end

  def down
    add_column :user_tweets, :polarity, :integer
  end
end
