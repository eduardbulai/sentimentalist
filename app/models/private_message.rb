class PrivateMessage < ActiveRecord::Base
  attr_accessible :datetime_sent, :user_id

  belongs_to :user, :inverse_of => :users
  has_one :message_recipient, :dependent => :destroy

  validates_presence_of :datetime_sent
  validates_presence_of :user_id
end
