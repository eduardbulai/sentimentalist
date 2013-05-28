class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.integer :friendlist_id, :null => false

      t.timestamps
    end
  end
end
