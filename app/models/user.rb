class User < ActiveRecord::Base
  attr_accessible :current_city, :email, :first_name, :id, :last_login, :last_name, :password

  has_many :pokes, :user_status_texts, :private_messages
end