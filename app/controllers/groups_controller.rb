class GroupsController < ApplicationController
	helper_method :join_group
	def index
		@group = Group.all
	end
	
	def show
		@group = Group.find(params[:id])
		@users = @group.users
	end

	def new
		@group = Group.new
	end
	def join_group
		
			@group = Group.find(params[:id])
		if current_user.group_id == @group.id
			flash[:notice] = "Already part of the group"
			redirect_to group_path(@group.id)
		else
			@users = @group.users << current_user
			redirect_to group_path(@group.id)
		end
	end
	def create
		@group = Group.new(group_params)
		if @group.save
			redirect_to groups_path
		else
			render 'new'
		end
	end

	private

	def group_params
		params.require(:group).permit(:name)
	end
end
