class AddBayesianEmotionsColumnToUserTweetsTable < ActiveRecord::Migration
  def up
    add_column :user_tweets, :bayesian_emotion, :string
  end

  def down
    remove_column :user_tweets, :bayesian_emotion
  end
end
