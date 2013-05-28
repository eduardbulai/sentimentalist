class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.integer :user_id, :NULL => false
      t.integer :message_recipient_id, :NULL => false
      t.datetime :datetime_sent, :NULL => false

      t.timestamps
    end
  end
end
