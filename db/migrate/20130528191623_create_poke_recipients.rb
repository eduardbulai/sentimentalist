class CreatePokeRecipients < ActiveRecord::Migration
  def change
    create_table :poke_recipients do |t|

      t.timestamps
    end
  end
end
