class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.integer :id
      t.integer :user_id
      t.datetime :datetime_sent

      t.timestamps
    end
  end
end
