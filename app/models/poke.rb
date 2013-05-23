class Poke < ActiveRecord::Base
  attr_accessible :id, :user_id

  belongs_to :user
end
