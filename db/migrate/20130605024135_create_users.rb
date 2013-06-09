class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :provider
      t.string :emotion_week
      t.string :emotion_month
      t.string :emotion_year
      t.string :polarity_week
      t.string :polarity_month
      t.string :polarity_year

      t.timestamps
    end
  end
end
