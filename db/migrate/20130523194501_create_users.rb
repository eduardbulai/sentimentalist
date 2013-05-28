class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.string :password, :null => false
      t.string :current_city, :null => false
      t.datetime :last_login

      t.timestamps
    end
  end
end
