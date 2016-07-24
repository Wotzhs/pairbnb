class ReservationsController < ApplicationController
	def new
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
			redirect_to root_path
		else
			redirect_to :back
		end
	end

	def edit
	end

	def update
	end

	def show
	end

	def index
	end

	def destroy
	end

	private
	def reservation_params
		params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date)
	end
end
