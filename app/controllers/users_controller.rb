class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@user = User.all
	end
	def show
		@user = User.find(params[:id])
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end
	def edit
		
	end
	def update
		 if @user.update(user_params)
      		flash[:notice] = "User updated successfully"
      		redirect_to user_path(@user)
    	else
      		render 'edit'
    	end
		
	end
	private
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
