class PrivateMessage < ActiveRecord::Base
  attr_accessible :datetime_sent, :id, :user_id

  belongs_to :user

  validates_presence_of :datetime_sent
  validates_presence_of :id
  validates_presence_of :user_id

  validates_format_of :datetime_sent, :with => Datetime
  validates_format_of :id, :with => Fixnum
  validates_format_of :user_id, :with => Fixnum
end
