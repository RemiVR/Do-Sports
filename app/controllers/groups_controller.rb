class GroupsController < ApplicationController

	def index
		@groups = Group.all.paginate(:per_page => 2, :page => params[:page])
		if !params[:search].nil?
			@groups = Group.search(params[:search])
		elsif !params[:filter].nil?
			@groups = Group.where(sport: Sport.find_by(title: params[:filter]))
		end
		@event = Event.all
		@sports = Sport.all
		@event_news = Event.where(date: Date.today.beginning_of_day..7.days.from_now).order("date ASC")
	end
	
	def show
		@group = set_group
		@users = @group.users
		@events = @group.events
		@sport = @group.sport.title
	end
 	def manage_group
 		@group = set_group
 	end
	def create_new_message
		@group = set_group
		@message = new_message(@group.id)
	end

	def join_new_group
		@group = set_group
		current_user.join_group(@group.id)
		redirect_to group_path(@group.id)
	end

	def leave_old_group
		@group = set_group
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
		@group = set_group
		@users = @group.users
	end

	def update
		@group = set_group
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
		params.require(:group).permit(:name, :sport_id, :logo, :description, :private_group)
	end
	def set_group
		Group.find(params[:id])
	end
	def admin_user
		@admin_user = Group.admin_id
	end
end
