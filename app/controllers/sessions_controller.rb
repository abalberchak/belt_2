class SessionsController < ApplicationController
	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			# Check below:
			session[:id] = @user.id
			redirect_to "/groups"
		else
			# flash['errors'] = 'Invalid'
			# flash['errors'] = @user.errors.full_messages
			redirect_to "/"
			
		end
	end


	def destroy
		session.clear
		redirect_to "/"
	end
end
