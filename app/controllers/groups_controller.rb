class GroupsController < ApplicationController
	helper_method :join_group
	def index
		@group = Group.all
	end
	
	def show
		@group = Group.find(params[:id])
		@users = @group.users
		@users_count = @users.count
	end

	def new
		@group = Group.new
	end
	def join_group
		@group = Group.find(params[:id])
		@users = @group.users << current_user
		redirect_to group_path(@group.id)
	end
	def leave_group
		
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
