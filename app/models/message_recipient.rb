class MessageRecipient < ActiveRecord::Base
  attr_accessible :message_id

  has_one :message

  validates_presence_of :message_id
end
