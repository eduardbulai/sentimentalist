class Poke < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user, :inverse_of => :users
  has_one :poke_recipient, :dependent => :destroy

  validates_presence_of :user_id
end
