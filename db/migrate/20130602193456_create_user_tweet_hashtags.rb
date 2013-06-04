class CreateUserTweetHashtags < ActiveRecord::Migration
  def change
    create_table :user_tweet_hashtags do |t|
      t.string :tag, :null => false
      t.integer :user_tweet_id, :null => false

      t.timestamps
    end
  end
end
