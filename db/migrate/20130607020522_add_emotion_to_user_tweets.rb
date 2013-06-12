class AddEmotionToUserTweets < ActiveRecord::Migration
  def up
  	add_column :user_tweets, :emotion, :string
  end

  def down
  	remove_column :user_tweets, :emotion
  end
end
