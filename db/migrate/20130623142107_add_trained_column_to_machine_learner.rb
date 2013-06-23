class AddTrainedColumnToMachineLearner < ActiveRecord::Migration
  def up
    add_column :machine_learners, :trained, :boolean
  end

  def down
    remove_column :machine_learners, :trained
  end
end
