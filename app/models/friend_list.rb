class FriendList < ActiveRecord::Base
  attr_accessible :id, :name, :user_id

  belongs_to :user
  has_many :friends
  has_many :friend_status_messages, :through => :friends

  validates_presence_of :id
  validates_presence_of :name
  validates_presence_of :user_id

  validates_format_of :id, :with => Fixnum
  validates_format_of :name, :with => String
  validates_format_of :user_id, :with => Fixnum
end
