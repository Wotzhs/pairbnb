module ReservationsHelper
	def find_all_reservations(listing_id)
		@dates = []
		@listing = Listing.find(listing_id)
		@listing.reservations.each_with_index do |r, index|
			@dates << (@listing.reservations[index].start_date..@listing.reservations[index].end_date-1).to_a
		end
		@dates.flatten
	end

	def get_list_price(listing_id)
		@listing = Listing.find(listing_id)
		@price = @listing.price.to_f
		@price
	end

	def overlap?(start_date, end_date, listing_id)
		dates = (start_date..end_date).to_a
		reserved = find_all_reservations(listing_id)
		(dates-reserved).length != dates.length
	end

	def no_of_nights(end_date, start_date)
		(end_date - start_date).to_i
	end

end
