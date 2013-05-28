class CreatePokeRecipients < ActiveRecord::Migration
  def change
    create_table :poke_recipients do |t|
    	t.integer :user_id, :NULL => false
    	t.integer :poke_id, :NULL => false

      t.timestamps
    end
  end
end
