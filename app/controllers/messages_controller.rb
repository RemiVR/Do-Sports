class MessagesController < ApplicationController

	def create
		@group = Group.find(params[:group_id])
		@message = @group.messages.create(params[:message].permit(:content, :user_id, :group_id))
	end
end
