class User < ActiveRecord::Base
  attr_accessible :current_city, :email, :first_name, :last_login, :last_name, :password

  has_many :pokes, :dependent => :destroy
  has_many :user_status_texts, :dependent => :destroy
  has_many :private_messages, :dependent => :destroy
  has_many :friends, :through => :friend_lists, :dependent => :destroy
  has_one :authentication, :dependent => :destroy

  validates_format_of :password, :with => /([^a-zA-Z]*([a-zA-Z]+)[^a-zA-Z]*){3,}/, :message => "your password must contain at least 3 alphabetic characters"
  validates_presence_of :current_city
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Please enter a valid email address."
  validates_format_of :password, :with => /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/, :message => "Your password must be at least 6 characters and include one number and one letter."
end