class UserMailer < ApplicationMailer
	default from: ENV['gmail']

	def welcome_email(user)
		@user = user
		@subject = "Welcome to the fake airbnb"
		mail(to: @user.email, subject: @subject )
	end
end
