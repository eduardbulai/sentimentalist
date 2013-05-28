class PokeRecipient < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :poke, :inverse_of => :poke

  validates_presence_of :poke_id
end
