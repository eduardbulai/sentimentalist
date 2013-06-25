class RemoveTrainedColumnFromMachineLearners < ActiveRecord::Migration
  def up
    remove_column :machine_learners, :trained
  end

  def down
    add_column :machine_learners, :trained, :boolean
  end
end
