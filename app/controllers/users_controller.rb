class UsersController < ApplicationController
	before_filter :authorize, except: [:new, :create]
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	def edit
	end

	def update
		 if @user.update_attributes(user_params)
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
