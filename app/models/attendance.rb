class Attendance < ActiveRecord::Base
	belongs_to :event
	belongs_to :user

	 validates_uniqueness_of :user_id, scope: [:event_id]
	 validate :ensure_group
	 validates_associated :event, message: "You have too many attendees"
	 private
	 def ensure_group
	 	if Event.find(event_id).group_id != User.find(user_id).group_id
	 		errors.add(:message, "You are not a member of this group")
	 	end
	 end
	
end

