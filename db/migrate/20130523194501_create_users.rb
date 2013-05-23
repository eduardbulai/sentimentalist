class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :current_city
      t.datetime :last_login

      t.timestamps
    end
  end
end
