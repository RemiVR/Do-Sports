class EventsController < ApplicationController
	def show
		@event = Event.find(params[:id])
		@attendance = @event.attendances.map do |attendance|
			attendance.user_id
		end
	end
	
	def new
		@group = Group.find(params[:group_id])
		@event = Event.new
	end

	def create
		@group = Group.find(params[:group_id])
		@event = @group.events.new event_params
		if @event.save
			redirect_to group_path(@event.group_id)
		else
			render 'new'
		end
	end

	def edit
		@event = Event.find(params[:id])
		@users = @event.users
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes event_params
			redirect_to manage_group_path(@event.group_id)
		else
			render 'edit'
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to manage_group_path(@event.group_id)
	end

	private

	def event_params
		params.require(:event).permit(:title, :max_size, :date, :description)
	end
end