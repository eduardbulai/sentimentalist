class FriendStatusText < ActiveRecord::Base
  attr_accessible :content, :datetime_posted, :friend_id

  belongs_to :friend

  validates_presence_of :datetime_posted
  validates_presence_of :friend_id
end
