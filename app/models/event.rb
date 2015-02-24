class Event < ActiveRecord::Base
	belongs_to :group
	has_many :attendences

	validates :title, presence: true
	validates :date, presence: true
	validates :group, presence: true
end
