class CreateFollowerTweets < ActiveRecord::Migration
  def change
    create_table :follower_tweets do |t|
      t.text :text, :null => false
      t.string :location, :null => false
      t.datetime :datetime_tweeted, :null => false

      t.timestamps
    end
  end
end
