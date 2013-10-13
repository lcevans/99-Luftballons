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

	def approve
		@luftballon_rental_request = LuftballonRentalRequest.find(params[:id])
		if @luftballon_rental_request.approve!
			flash[:notice] = "Approval went through"
			redirect_to luftballon_url(@luftballon_rental_request.luftballon_id)
		else
			flash[:errors] = "Could not approve (this shouldn't have happened though...)"
			redirect_to luftballon_url(@luftballon_rental_request.luftballon_id)
		end
	end

	def deny
		@luftballon_rental_request = LuftballonRentalRequest.find(params[:id])
		if @luftballon_rental_request.deny!
			flash[:notice] = "Denial went through"
			redirect_to luftballon_url(@luftballon_rental_request.luftballon_id)
		else
			flash[:errors] = "Could not deny (this shouldn't have happened though...)"
			redirect_to luftballon_url(@luftballon_rental_request.luftballon_id)
		end
	end

end
