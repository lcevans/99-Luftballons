class LuftballonsController < ApplicationController

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
end
