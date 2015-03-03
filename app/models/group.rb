class Group < ActiveRecord::Base
	has_many :users
	has_many :events
	belongs_to :sport

	has_attached_file :logo, styles: {:medium => "200x200>", :thumb => "140x140>"}
  	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
