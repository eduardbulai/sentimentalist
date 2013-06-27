class RemoveTimeframeColumnsFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :emotion_week
    remove_column :users, :emotion_month
    remove_column :users, :emotion_year
    remove_column :users, :polarity_week
    remove_column :users, :polarity_month
    remove_column :users, :polarity_year
    remove_column :users, :bayesian_emotion_week
    remove_column :users, :bayesian_emotion_month
    remove_column :users, :bayesian_emotion_year
    add_column :users, :emotion, :string
    add_column :users, :bayesian_emotion, :string
    add_column :users, :polarity, :string
    add_column :users, :bayesian_polarity, :string
  end

  def down
    remove_column :users, :bayesian_polarity
    remove_column :users, :polarity
    remove_column :users, :bayesian_emotion
    remove_column :users, :emotion
    add_column :users, :bayesian_emotion_year, :string
    add_column :users, :bayesian_emotion_month, :string
    add_column :users, :bayesian_emotion_week, :string
    add_column :users, :polarity_year, :string
    add_column :users, :polarity_month, :string
    add_column :users, :polarity_week, :string
    add_column :users, :emotion_year, :string
    add_column :users, :emotion_month, :string
    add_column :users, :emotion_week, :string
  end
end
