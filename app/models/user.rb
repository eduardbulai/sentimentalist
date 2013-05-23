class User < ActiveRecord::Base
  attr_accessible :current_city, :email, :first_name, :id, :last_login, :last_name, :password

  has_many :pokes
  has_many :user_status_texts
  has_many :private_messages

  has_many :friends, :through => :friend_lists

  validates_format_of :password, :with => /([^a-zA-Z]*([a-zA-Z]+)[^a-zA-Z]*){3,}/, :message => "your password must contain at least 3 alphabetic characters"
  validates_presence_of :current_city
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :last_login
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :id

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Please enter a valid email address."

end