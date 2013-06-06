class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :name, :null => false
      t.string :twitter_handle, :null => false
      t.string :location
      t.integer :user_id, :null => false
      t.string :twitter_id, :null => false

      t.timestamps
    end
  end
end
