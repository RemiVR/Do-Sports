class GroupsController < ApplicationController

	def index
		@groups = Group.all
		@group = Group.new
		if !params[:search].nil?
			@groups = Group.search(params[:search])
		elsif !params[:filter].nil?
			@groups = Group.where(sport: Sport.find_by(title: params[:filter]))
		end
		@event = Event.all
		@sports = Sport.all
		@event_news = Event.where(date: Date.today.beginning_of_day..Date.today.end_of_week).order("date ASC")
	end
	
	def show
		@group = Group.find(params[:id])
		@users = @group.users
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
			redirect_to '/'
		end
	end

	def edit
		@sports = Sport.all
		@group = Group.find(params[:id])
		@users = @group.users
	end

	def update
		@group = Group.find(params[:id])
		if @group.update_attributes group_params
			redirect_to group_path(@group.id)
		else
			render 'edit'
		end
	end

	def destroy
		@group = Group.find(params[:id])
		@group.events.destroy_all
		@group.users.map do |user|
			user.leave_group(@group.id)
		end
		@group.destroy
		redirect_to root_path
	end

	private
	
	def group_params
		params.require(:group).permit(:name, :sport_id, :logo, :description)
	end
	def admin_user
		@admin_user = Group.admin_id
	end

end
