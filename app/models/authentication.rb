class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id

  validates_presence_of :provider
  validates_presence_of :uid
  validates_presence_of :user_id

  validates_format_of :provider, :with => String
  validates_format_of :uid, :with => String
  validates_numericality_of :uid
  validates_format_of :user_id, :with => Fixnum

end
