class ReservationsController < ApplicationController

	include ReservationsHelper

	def new
		@reservation = Reservation.new(reservation_params)
		if !@reservation.valid?
			redirect_to :back
		end
		gon.client_token = generate_client_token
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		@host = User.find(@reservation.listing.user_id)
		@result = Braintree::Transaction.sale(
				amount: no_of_nights(@reservation.end_date,@reservation.start_date) * get_list_price(@reservation.listing_id),
				payment_method_nonce: params[:payment_method_nonce])
		if @result.success?
			if @reservation.save
				ReservationMailer.notify_host(@host, @reservation.listing).deliver_later
				ReservationJob.perform_later(current_user, @reservation.listing)
				redirect_to root_path
			else
				redirect_to :back
			end
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

	def generate_client_token
		Braintree::ClientToken.generate
	end
end
