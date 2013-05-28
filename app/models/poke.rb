class Poke < ActiveRecord::Base
  attr_accessible :user_id, :recipient_id

  belongs_to :user, :message_recipient

  validates_presence_of :message_recipient_id
  validates_presence_of :user_id
end
