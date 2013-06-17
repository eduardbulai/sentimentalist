class CreateMachineLearners < ActiveRecord::Migration
  def change
    create_table :machine_learners do |t|
      t.boolean :stemming
      t.string :name
      t.string :wcount
      t.string :ccount
      t.text :ignore_words
      t.integer :user_id

      t.timestamps
    end
  end
end
