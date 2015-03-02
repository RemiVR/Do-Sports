class Group < ActiveRecord::Base
	has_many :users
	has_many :events
	belongs_to :sport

end
