class Event < ActiveRecord::Base
	belongs_to :group
	has_many :attendances
	has_many :users, through: :attendances

	validates :title, presence: true
	validates :date, presence: true
	validates :group, presence: true
end
