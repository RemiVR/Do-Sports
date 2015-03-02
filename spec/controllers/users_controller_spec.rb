require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	describe "user existance" do
		let(:user) { create(:user, name: "remi", presence: true, length: { in: 2..255 }) }
			it "should check if user exist" do
				get :show, name: "remi"
      			expect(response).to be_success
      		end
	end
end
