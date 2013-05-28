class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :provider, :NULL => false
      t.string :uid, :NULL => false
      t.integer :user_id, :NULL => false

      t.timestamps
    end
  end
end
