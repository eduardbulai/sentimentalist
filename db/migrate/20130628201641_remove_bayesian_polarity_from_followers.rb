class RemoveBayesianPolarityFromFollowers < ActiveRecord::Migration
  def up
    remove_column :followers, :bayesian_polarity
  end

  def down
    add_column :followers, :bayesian_polarity, :string
  end
end
