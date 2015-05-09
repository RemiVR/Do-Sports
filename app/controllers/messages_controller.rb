class MessagesController < ApplicationController
	def index
		@messages = Message.all
	end
	def new
		@message = Message.new
	end
	def create
		@message = Message.new message_params
		if @message.save
			redirect_to messages_path
		else
			render 'new'
		end
	end

	# def new
	# 	@message = Message.new
	# end

	# def create
	# 	@message = Group.find(params[:id]).messages.new(user_id: current_user.id)
	# 	if @message.save
	# 		redirect_to group_path(params[:id])
	# 	else
	# 		redirect_to group_path(params[:id])
	# 	end
	# end

	private

	def message_params
		params.require(:message).permit(:content, :user_id, :group_id)
	end
end
