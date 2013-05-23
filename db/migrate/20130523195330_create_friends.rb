class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :id
      t.string :first_name
      t.string :last_name
      t.integer :friendlist_id

      t.timestamps
    end
  end
end
