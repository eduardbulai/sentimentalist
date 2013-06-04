class CreateUserTweets < ActiveRecord::Migration
  def change
    create_table :user_tweets do |t|
      t.text :text, :null => false
      t.string :location, :null => false
      t.datetime :datetime_tweeted, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
