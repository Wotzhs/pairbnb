# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
	def notify_host
		ReservationMailer.notify_host(User.first, Listing.first)
	end
end
