class FriendList < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_many :friends
  has_many :friend_status_messages, :through => :friends

  validates_presence_of :name
  validates_presence_of :user_id
end
