class ListingsController < ApplicationController

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to listings_path
		else
			render :new
		end
	end

	def new
		@listing = Listing.new
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
	end

	def index
	end

	private 
	def listing_params
		params.require(:listing).permit(:title, :description, :price, :country_id, :state_id, :city_id)
	end 

end
