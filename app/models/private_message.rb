class PrivateMessage < ActiveRecord::Base
  attr_accessible :datetime_sent, :id, :user_id

  belongs_to :user
end
