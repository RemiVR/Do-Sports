class FeedbacksController < ApplicationController

	def index
		@feedback = Feedback.all
	end
	def new
		@feedback = Feedback.new
	end
	def create
		@feedback = Feedback.new feedback_params
		if @feedback.save
			redirect_to feedbacks_path
		else
			render 'new'
		end
	end

	private
	def feedback_params
		params.require(:feedback).permit(:name, :body)
	end
end
