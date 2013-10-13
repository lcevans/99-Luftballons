class SessionsController < ApplicationController
	def new
		render :new
	end

	def create
		@user = User.find_by_credentials(params[:user][:user_name],params[:user][:password])
		if !!@user
			login_user(@user)
			redirect_to :root
		else
			flash[:errors] ||= []
			flash[:errors] << "Incorrect name or password"
			render :new
		end
	end

	def destroy
		logout!
		redirect_to :root
	end
end
