class LuftballonRentalRequestsController < ApplicationController
	def new
		@luftballon_rental_request = LuftballonRentalRequest.new
		render :new
	end

	def create
		@luftballon_rental_request = LuftballonRentalRequest.new(params[:luftballon_rental_request])
		if @luftballon_rental_request.save
		  flash[:notice] = "Rental request successfully saved"
		  redirect_to luftballon_url(@luftballon_rental_request.luftballon_id)	
		else
			flash[:errors] = @luftballon_rental_request.errors.full_messages
			render :new
		end
	end


end
