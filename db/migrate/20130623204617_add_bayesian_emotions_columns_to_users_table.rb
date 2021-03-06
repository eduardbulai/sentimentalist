class AddBayesianEmotionsColumnsToUsersTable < ActiveRecord::Migration
  def up
    add_column :users, :bayesian_emotion_week, :string
    add_column :users, :bayesian_emotion_month, :string
    add_column :users, :bayesian_emotion_year, :string
  end

  def down
    remove_column :users, :bayesian_emotion_year
    remove_column :users, :bayesian_emotion_month
    remove_column :users, :bayesian_emotion_week
  end
end
