class FriendStatusText < ActiveRecord::Base
  attr_accessible :content, :datetime_posted, :friend_id, :id

  belongs_to :friend
end
