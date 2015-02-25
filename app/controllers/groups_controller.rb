class GroupsController < ApplicationController
	helper_method :join_group

	def index
		@group = Group.all
	end
	
	def show
		@group = Group.find(params[:id])
		@users = @group.users
		@users_count = @users.count
		@events = @group.events
	end

	def new
		@group = Group.new
	end

	def join_new_group
		@group = Group.find(params[:id])
		current_user.join_group(@group.id)
		redirect_to group_path(@group.id)
	end

	def leave_old_group
		@group = Group.find(params[:id])
		current_user.leave_group(@group.id)
		redirect_to group_path(@group.id)
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			redirect_to '/'
		else
			render 'new'
		end
	end

	private

	def group_params
		params.require(:group).permit(:name)
	end

end
