class Event < ActiveRecord::Base
	belongs_to :group
	has_many :attendances
	has_many :users, through: :attendances

	validates :title, presence: true
	validates :date, presence: true
	validates :group, presence: true
	
	validates_each :users do |event, attr, value|
	  event.errors.add attr, "too much attendees for event" if event.users.size >= event.max_size
	 end
end
