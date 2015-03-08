require 'rails_helper'

RSpec.describe Event, type: :model do
	describe "validations" do
		it "is invalid if it has no title" do
			event = Event.create(title: nil, description: "Blah", date: Date.today, max_size: 3, group_id: 1)
			expect(event).to be_invalid
		end
		it "is invalid if it has no description"
			event = Event.create(title: "Blah", description: nil, date: Date.today, max_size: 3, group_id: 1)
			expect(event).to be_invalid
	end
end