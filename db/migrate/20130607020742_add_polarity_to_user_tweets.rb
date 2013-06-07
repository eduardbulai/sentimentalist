class AddPolarityToUserTweets < ActiveRecord::Migration
  def up
  	add_column :user_tweets, :polarity, :integer
  end

  def down
  	remove_column :user_tweets, :polarity
  end
end
