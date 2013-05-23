class FriendStatusText < ActiveRecord::Base
  attr_accessible :content, :datetime_posted, :friend_id, :id
end
