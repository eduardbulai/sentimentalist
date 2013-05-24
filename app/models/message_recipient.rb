class MessageRecipient < ActiveRecord::Base
  attr_accessible :id, :message_id, :user_id
end
