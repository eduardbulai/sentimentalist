class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :twitter_handle, :null => false
      t.string :location, :null => false

      t.timestamps
    end
  end
end
