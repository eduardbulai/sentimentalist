class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :first_name, :NULL => false
      t.string :last_name, :NULL => false
      t.integer :friendlist_id, :NULL => false

      t.timestamps
    end
  end
end
