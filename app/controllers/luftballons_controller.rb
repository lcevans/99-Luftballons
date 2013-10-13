class LuftballonsController < ApplicationController

	before_filter :has_right_to_modify, :only => [:edit, :update, :destroy]

	def index
		@luftballons = Luftballon.all
		render :index
	end

	def new
		@luftballon = Luftballon.new
		render :new
	end

	def create
		@luftballon = Luftballon.create(params[:luftballon])
		@luftballon.user_id = current_user_id
		if @luftballon.save
			flash[:notice] = "Luftballon successfully created"
			redirect_to luftballons_url
		else
			flash[:errors] = @luftballon.errors.full_messages
			render :new
		end
	end

	def show
		@luftballon = Luftballon.find(params[:id])
		render :show
	end

	def edit
		@luftballon = Luftballon.find(params[:id])
		render :edit
	end

	def update
		@luftballon = Luftballon.find(params[:id])
		if @luftballon.update_attributes(params[:luftballon])
			flash[:notice] = "Luftballon successfully updated"
			redirect_to luftballon_url(@luftballon)
		else
			flash[:errors] = @luftballon.errors.full_messages
			render :edit
		end
	end

	def destroy
		@luftballon = Luftballon.find(params[:id])
		@luftballon.destroy
		redirect_to luftballons_url
	end

	def has_right_to_modify
		@luftballon = Luftballon.find(params[:id])
		unless @luftballon.user_id.nil? || (@luftballon.user_id == current_user_id)
			flash[:errors] ||= []
			flash[:errors] << "Tampering with another's luftballon is strictly verboten!"
			redirect_to luftballon_url(@luftballon)
		end
	end
end
