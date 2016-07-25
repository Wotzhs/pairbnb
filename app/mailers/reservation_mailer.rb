class ReservationMailer < ApplicationMailer
	default from: ENV['gmail']

	def notify_host(host, listing)
		@host = host
		@listing = listing
		@subject = "Reservation for #{listing.title}"
		mail(to: @host.email, subject: @subject)
	end

	def notify_client(client, listing)
		@client = client
		@subject = "Reservation for #{listing.title}"
		@listing = listing
		mail(to: @client.email, subject: @subject)
	end

end
