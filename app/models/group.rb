class Group < ActiveRecord::Base
	has_many :users
	has_many :events
	belongs_to :sport

	has_attached_file :logo, styles: {:medium => "240x240>", :thumb => "100x100>"}
  	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
