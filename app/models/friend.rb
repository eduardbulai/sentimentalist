class Friend < ActiveRecord::Base
  attr_accessible :first_name, :friendlist_id, :id, :last_name

  has_many :friend_status_texts
  belongs_to :friend_list
end
