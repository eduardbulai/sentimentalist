class CreatePokes < ActiveRecord::Migration
  def change
    create_table :pokes do |t|
      t.integer :id
      t.integer :user_id

      t.timestamps
    end
  end
end