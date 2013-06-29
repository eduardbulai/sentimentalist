class RemoveBayesianPolarityFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :bayesian_polarity
  end

  def down
    add_column :users, :bayesian_polarity, :string
  end
end
