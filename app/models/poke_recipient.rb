class PokeRecipient < ActiveRecord::Base
  attr_accessible :user_id, :poke_id

  belongs_to :poke

  has_one :user_id, :through => :poke

  validates_presence_of :poke_id
  validates_presence_of :user_id
end
