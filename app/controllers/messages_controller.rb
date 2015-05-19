class MessagesController < ApplicationController
	def create
		@group = Group.find(params[:group_id])
		@message = @group.messages.create(params[:message].permit(:content, :user_id, :group_id))

		redirect_to group_path(@group)
	end
end
