class Follower < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :location, :twitter_handle, :user_id

  has_many :follower_tweets, :foreign_key => :follower_id, :dependent => :destroy
  belongs_to :user, :inverse_of => :followers

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :location
  validates_presence_of :twitter_handle

end
