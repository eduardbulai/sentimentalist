class Friend < ActiveRecord::Base
  attr_accessible :first_name, :friendlist_id, :id, :last_name

  has_many :friend_status_texts
  belongs_to :friend_list

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :friendlist_id
  validates_presence_of :id

  validates_numericality_of :friendlist_id
  validates_numericality_of :id

  validates :first_name, :length => { :maximum => 12 }
  validates :last_name, :length => { :maximum => 12 }
  validates_format_of :password, :with => /([^a-zA-Z])/
end

