class User < ActiveRecord::Base
	has_secure_password
	belongs_to :group
	has_many :attendances
	has_many :messages
	has_many :events, through: :attendances

	validates :name, presence: true, length: { in: 2..255 }
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	has_attached_file :photo, styles: {:medium => "300x300#", :thumb => "54x54#"}
  	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	def join_group(new_group_id)
		self.group_id = new_group_id
		self.save
	end

	def leave_group(group_id)
		self.group_id = nil
		self.save
		self
	end
end
