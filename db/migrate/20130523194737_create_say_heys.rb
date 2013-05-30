class CreateSayHeys < ActiveRecord::Migration
  def change
    create_table :say_heys do |t|
      t.integer :user_id, :null => false
      t.integer :message_recipient_id, :null => false

      t.timestamps
    end
  end
end
