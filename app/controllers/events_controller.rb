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
			redirect_to group_path(@event.group_id)
		else
			render 'new'
		end
	end


	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes event_params
			redirect_to group_path(@event.group_id)
		else
			render 'edit'
		end
	end


	private

	def event_params
		params.require(:event).permit(:title, :date)
	end
end