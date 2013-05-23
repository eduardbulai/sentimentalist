class User < ActiveRecord::Base
  attr_accessible :current_city, :email, :first_name, :id, :last_login, :last_name, :password

  has_many :pokes
  has_many :user_status_texts
  has_many :private_messages

  has_many :friends, :through => :friend_lists
end