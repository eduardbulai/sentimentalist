class MessageRecipient < ActiveRecord::Base
  attr_accessible :id, :message_id, :user_id

  validates_presence_of :id
  validates_presence_of :message_id
  validates_presence_of :user_id

  validates_format_of :id, :with => Fixnum
  validates_format_of :message_id, :with => Fixnum
  validates_format_of :user_id, :with => Fixnum
end
