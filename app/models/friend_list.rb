class FriendList < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user, :inverse_of => :friend_lists
  has_many :friends, :dependent => :destroy
  has_many :friend_status_messages, :through => :friends, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :user_id
end
