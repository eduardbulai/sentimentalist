class SayHey < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user, :inverse_of => :users
  has_one :say_hey_recipient, :dependent => :destroy

  validates_presence_of :user_id
end
