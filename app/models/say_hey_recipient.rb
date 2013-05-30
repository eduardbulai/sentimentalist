class SayHeyRecipient < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :say_hey, :inverse_of => :say_hey

  validates_presence_of :say_hey_id
end
