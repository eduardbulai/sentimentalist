class Follower < ActiveRecord::Base
  attr_accessible :name, :location, :twitter_handle, :user_id, :twitter_id

  has_many :follower_tweets, :foreign_key => :follower_id, :dependent => :destroy
  belongs_to :user, :inverse_of => :followers

  validates_presence_of :name
  validates_presence_of :twitter_handle
  validates_presence_of :user_id
  validates_presence_of :twitter_id

end
