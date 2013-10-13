class UsersController < ApplicationController
	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "User created"
			login_user(@user)
			redirect_to :root
		else
			flash[:errors] = @user.errors.full_messages
			render :new
		end
	end
end
