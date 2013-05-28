class CreateUserStatusTexts < ActiveRecord::Migration
  def change
    create_table :user_status_texts do |t|
      t.integer :user_id, :NULL => false
      t.datetime :datetime_posted, :NULL => false
      t.text :content

      t.timestamps
    end
  end
end
