class GroupsController < ApplicationController

	def index
		@group = Group.all
	end
	
	def show
		@group = Group.find(params[:id])
		@users = @group.users
		@users_count = @users.count
		@events = @group.events
		@sport = @group.sport.title
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

	def new
		@sports = Sport.all
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		@group.admin_id = current_user.id
		if @group.save
			current_user.join_group(@group.id)
			redirect_to group_path(@group.id)
		else
			render 'new'
		end
	end

	def destroy
		@group = Group.find(params[:id])
		@group.users.map do |user|
			user.leave_group(@group.id)
		end
		@group.destroy
		redirect_to root_path
	end

	private

	def group_params
		params.require(:group).permit(:name, :sport_id)
	end
	def admin_user
		@admin_user = Group.admin_id
	end

end
