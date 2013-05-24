class AddRecipientIdColumnToMessage < ActiveRecord::Migration
  def up
  	add_column :private_messages, :recipient_id, :integer
  end

  def down
  	remove_column :private_messages, :recipient_id, :integer
  end
end
