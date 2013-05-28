class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :NULL => false
      t.string :last_name, :NULL => false
      t.string :email, :NULL => false
      t.string :password, :NULL => false
      t.string :current_city, :NULL => false
      t.datetime :last_login

      t.timestamps
    end
  end
end
