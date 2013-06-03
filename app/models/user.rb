class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :location, :twitter_handle

  has_many :followers, :foreign_key => :user_id, :dependent => :destroy
  has_many :user_tweets,:foreign_key => :user_id, :dependent => :destroy
  has_one :authentications,:foreign_key => :user_id, :dependent => :destroy

  validates_presence_of :location
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Please enter a valid email address."

end
