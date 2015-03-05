class SessionsController < ApplicationController
	def new
	end
	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
      	else
      		flash[:error] = "Wrong authentication"
      	end
  		redirect_to '/'
	end
	def destroy
		session[:user_id] = nil
    	redirect_to groups_path(:group_id)
	end
end
