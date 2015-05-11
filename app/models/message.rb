class Message < ActiveRecord::Base
	belongs_to :group
	belongs_to :user

	def new_message(new_group_id)
		self.group_id = new_group_id
		self.save
	end
end
