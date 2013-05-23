class FriendList < ActiveRecord::Base
  attr_accessible :id, :name, :user_id

  has_many :friends
  belongs_to :user
end
