class Group < ActiveRecord::Base
	has_many :users
	has_many :events, dependent: :destroy
	belongs_to :sport

	has_attached_file :logo, styles: {:medium => "200x200>", :thumb => "140x140>"}
  	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  	def self.search(search)
  		if search
    		where("name ILIKE ?", "%#{search}%")
  		else
    		all
  		end
	end
end
