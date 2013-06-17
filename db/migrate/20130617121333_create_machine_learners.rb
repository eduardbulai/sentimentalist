class CreateMachineLearners < ActiveRecord::Migration
  def change
    create_table :machine_learners do |t|
      t.boolean :stemming
      t.string :name
      t.string :wcount
      t.string :ccount
      t.string :ignore_words
      t.string :storage

      t.timestamps
    end
  end
end
