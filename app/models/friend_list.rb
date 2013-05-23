class FriendList < ActiveRecord::Base
  attr_accessible :id, :name, :user_id

  belongs_to :user
  has_many :friends
  has_many :friend_status_messages, :through => :friends
end
