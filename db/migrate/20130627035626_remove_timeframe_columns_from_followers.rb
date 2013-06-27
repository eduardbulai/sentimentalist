class RemoveTimeframeColumnsFromFollowers < ActiveRecord::Migration
  def up
    remove_column :followers, :emotion_week
    remove_column :followers, :emotion_month
    remove_column :followers, :emotion_year
    remove_column :followers, :polarity_week
    remove_column :followers, :polarity_month
    remove_column :followers, :polarity_year
    remove_column :followers, :bayesian_emotion_week
    remove_column :followers, :bayesian_emotion_month
    remove_column :followers, :bayesian_emotion_year
    add_column :followers, :emotion, :string
    add_column :followers, :bayesian_emotion, :string
    add_column :followers, :polarity, :string
    add_column :followers, :bayesian_polarity, :string
  end

  def down
    remove_column :followers, :bayesian_polarity
    remove_column :followers, :polarity
    remove_column :followers, :bayesian_emotion
    remove_column :followers, :emotion
    add_column :followers, :bayesian_emotion_year, :string
    add_column :followers, :bayesian_emotion_month, :string
    add_column :followers, :bayesian_emotion_week, :string
    add_column :followers, :polarity_year, :string
    add_column :followers, :polarity_month, :string
    add_column :followers, :polarity_week, :string
    add_column :followers, :emotion_year, :string
    add_column :followers, :emotion_month, :string
    add_column :followers, :emotion_week, :string
  end
end
