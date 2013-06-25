class AddResqueCompleteToUser < ActiveRecord::Migration
  def up
    add_column :users, :resque_complete, :boolean
  end

  def down
    remove_column :users, :resque_complete
  end
end
