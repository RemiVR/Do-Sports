class EventsController < ApplicationController
	def show

	end
	
	def new
		@group = Group.find(params[:group_id])
		@event = Event.new
	end

	def create
		@group = Group.find(params[:group_id])
		@event = @group.events.new event_params
		if @event.save
			redirect_to '/'
		else
			render 'new'
		end

	end
	
	def attendance
		
	end

	private

	def event_params
		params.require(:event).permit(:title, :date)
	end

	def create_attendance(event_id, user_id)
		@attendance = Event.find(event_id).attendances.create(user_id: user_id)
	end
end