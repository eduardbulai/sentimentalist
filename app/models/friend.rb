class Friend < ActiveRecord::Base
  attr_accessible :first_name, :friendlist_id, :last_name

  has_many :friend_status_texts
  belongs_to :friend_list

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :friendlist_id

  validates_numericality_of :friendlist_id

  validates :first_name, :length => { :maximum => 12 }
  validates :last_name, :length => { :maximum => 12 }
  validates_format_of :first_name, :with => /([^a-zA-Z])/, :message => "Please enter only letters"
  validates_format_of :last_name, :with => /([^a-zA-Z])/, :message => "Please enter only letters"
end

