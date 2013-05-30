class CreateSayHeyRecipients < ActiveRecord::Migration
  def change
    create_table :say_hey_recipients do |t|
    	t.integer :user_id, :null => false
    	t.integer :poke_id, :null => false

      t.timestamps
    end
  end
end
