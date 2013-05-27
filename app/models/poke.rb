class Poke < ActiveRecord::Base
  attr_accessible :id, :user_id

  belongs_to :user

  validates_presence_of :id
  validates_presence_of :user_id

  validates_format_of :id, :with => Fixnum
  validates_format_of :user_id, :with => Fixnum
end
