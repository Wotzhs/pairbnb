class ListingsController < ApplicationController

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to @listing
		else
			render :new
		end
	end

	def new
		@listing = Listing.new
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		if @listing.update(listing_params)
			redirect_to @listing
		else
			render :edit
		end
	end

	def show
		@listing = Listing.find(params[:id])
		@reservation = Reservation.new		
	end

	def destroy
	end

	def index
		@listing = Country.search_by_desc(params[:search][:destination]).first.listings
	end

	private 
	def listing_params
		params.require(:listing).permit(:title, :description, :price, :country_id, :state_id, :city_id, :cover, {images: []})
	end 

end
