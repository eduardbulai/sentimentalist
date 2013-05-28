class CreateMessageRecipients < ActiveRecord::Migration
  def change
    create_table :message_recipients do |t|
      t.integer :message_id, :null => false

      t.timestamps
    end
  end
end
