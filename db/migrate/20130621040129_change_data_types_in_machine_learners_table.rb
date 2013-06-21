class ChangeDataTypesInMachineLearnersTable < ActiveRecord::Migration
  def up
  	remove_column :machine_learners, :ccount
  	remove_column :machine_learners, :wcount
  	add_column :machine_learners, :ccount, :text
  	add_column :machine_learners, :wcount, :text
  end

  def down
  	remove_column :machine_learners, :wcount
  	remove_column :machine_learners, :ccount
  	add_column :machine_learners, :wcount, :string
  	add_column :machine_learners, :ccount, :string
  end
end
