class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id

  belongs_to :user, :inverse_of => :authentication

  validates_presence_of :provider
  validates_presence_of :uid
  validates_presence_of :user_id
end
