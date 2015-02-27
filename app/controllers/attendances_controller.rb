class AttendancesController < ApplicationController
	before_filter :authorize, only: [:new, :create, :destroy]

	def new
		@event = Event.find(params[:id])
		@attendance = @event.attendance.new
	end

	def create
		@attendance = Event.find(params[:id]).attendances.create(user_id: current_user.id)
		if @attendance.save
			redirect_to event_path(params[:id])
		else
			redirect_to event_path(params[:id])
		end
	end

	def destroy
		@attendance = Attendance.where({user_id: current_user.id, event_id: params[:id]}).first
		@attendance.destroy
		redirect_to event_path(params[:id])
	end
end
