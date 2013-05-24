class CreateMessageRecipients < ActiveRecord::Migration
  def change
    create_table :message_recipients do |t|
      t.integer :id
      t.integer :user_id
      t.integer :message_id

      t.timestamps
    end
  end
end
