class EventsController < ApplicationController
	def show
		@event = Event.find(params[:id])
		@attendance = @event.attendances
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

	private

	def event_params
		params.require(:event).permit(:title, :date)
	end
end