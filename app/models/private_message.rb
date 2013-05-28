class PrivateMessage < ActiveRecord::Base
  attr_accessible :datetime_sent, :user_id, :recipient_id

  belongs_to :user, :message_recipient

  validates_presence_of :datetime_sent
  validates_presence_of :user_id
  validates_presence_of :message_recipient_id
end
