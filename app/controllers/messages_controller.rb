class MessagesController < ApplicationController
	def new
		@messages = Message.all.order("created_at ASC")
		@message = Message.new
	end
	def create
		@message = Message.new message_params
		if @message.save
			redirect_to new_message_path
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

	def destroy
		@message = Message.find(params[:id])
		@message.destroy
		redirect_to new_message_path
	end

	private

	def message_params
		params.require(:message).permit(:content, :user_id)
	end
end
