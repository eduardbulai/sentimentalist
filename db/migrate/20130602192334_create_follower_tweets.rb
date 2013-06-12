class CreateFollowerTweets < ActiveRecord::Migration
  def change
    create_table :follower_tweets do |t|
      t.text :text, :null => false
      t.datetime :datetime_tweeted, :null => false
      t.integer :follower_id, :null => false
<<<<<<< HEAD
=======
      t.string :tweet_id, :null => false
>>>>>>> resque

      t.timestamps
    end
  end
end
