class CreateUserTweets < ActiveRecord::Migration
  def change
    create_table :user_tweets do |t|
      t.text :text, :null => false
      t.datetime :datetime_tweeted, :null => false
      t.integer :user_id, :null => false
<<<<<<< HEAD
=======
      t.string :tweet_id, :null => false
>>>>>>> resque

      t.timestamps
    end
  end
end
