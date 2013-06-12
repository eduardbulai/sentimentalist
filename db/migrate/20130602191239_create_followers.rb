class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :name, :null => false
      t.string :twitter_handle, :null => false
<<<<<<< HEAD
      t.string :location, :null => false
      t.integer :user_id, :null => false
=======
      t.string :location
      t.integer :user_id, :null => false
      t.string :twitter_id, :null => false
      t.string :emotion_week
      t.string :emotion_month
      t.string :emotion_year
      t.string :polarity_week
      t.string :polarity_month
      t.string :polarity_year
>>>>>>> resque

      t.timestamps
    end
  end
end
