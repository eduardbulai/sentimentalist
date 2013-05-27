class FriendStatusText < ActiveRecord::Base
  attr_accessible :content, :datetime_posted, :friend_id, :id

  belongs_to :friend

  validates_presence_of :content
  validates_presence_of :datetime_posted
  validates_presence_of :friend_id

  validates_format_of :datetime_posted, :with => Datetime
  validates_format_of :friend_id, :with => Fixnum
  validates_format_of :content, :with => String
end
