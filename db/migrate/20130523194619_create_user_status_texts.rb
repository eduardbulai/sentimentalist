class CreateUserStatusTexts < ActiveRecord::Migration
  def change
    create_table :user_status_texts do |t|
      t.integer :id
      t.integer :user_id
      t.datetime :datetime_posted
      t.text :content

      t.timestamps
    end
  end
end
