class FriendList < ActiveRecord::Base
  attr_accessible :id, :name, :user_id
end
