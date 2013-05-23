class UserStatusText < ActiveRecord::Base
  attr_accessible :content, :datetime_posted, :id, :user_id

  belongs_to :user
end
