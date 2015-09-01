class MessagesController < ApplicationController

	def new
		@message = Message.new
	end

	def create
		@group = Group.find(params[:group_id])
		@message = @group.messages.create(params[:message].permit(:content, :user_id, :group_id))
	end
end
