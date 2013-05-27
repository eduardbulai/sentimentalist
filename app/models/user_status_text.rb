class UserStatusText < ActiveRecord::Base
  attr_accessible :content, :datetime_posted, :id, :user_id

  belongs_to :user

  validates_presence_of :content
  validates_presence_of :datetime_posted
  validates_presence_of :id
  validates_presence_of :user_id

  validates_format_of :content, :with => String
  validates_format_of :datetime_posted, :with => Datetime
  validates_format_of :id, :with => Fixnum
  validates_format_of :user_id, :with => Fixnum
end
