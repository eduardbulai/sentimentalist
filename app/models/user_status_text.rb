class UserStatusText < ActiveRecord::Base
  attr_accessible :content, :datetime_posted, :user_id

  belongs_to :user, :inverse_of => :users

  validates_presence_of :datetime_posted
  validates_presence_of :user_id
end
