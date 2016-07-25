module ReservationsHelper
	def find_all_reservations(listing_id)
		@dates = []
		@listing = Listing.find(listing_id)
		@listing.reservations.each_with_index do |r, index|
			@dates << (@listing.reservations[index].start_date..@listing.reservations[index].end_date-1).to_a
		end
		@dates.flatten
	end
end
