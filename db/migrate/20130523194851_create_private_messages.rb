class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.integer :user_id, :null => false
      t.integer :message_recipient_id, :null => false
      t.datetime :datetime_sent, :null => false

      t.timestamps
    end
  end
end
