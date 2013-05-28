class MessageRecipient < ActiveRecord::Base
  attr_accessible :private_message_id

  belongs_to :private_message, :inverse_of => :private_message

  validates_presence_of :private_message_id
end
