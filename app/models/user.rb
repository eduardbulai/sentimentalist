class User < ActiveRecord::Base
  attr_accessible :current_city, :email, :first_name, :id, :last_login, :last_name, :password
end
