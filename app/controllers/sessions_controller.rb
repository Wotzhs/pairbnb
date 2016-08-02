class SessionsController < Clearance::SessionsController
	def create_from_omniauth
		@prev = request.referer
		auth_hash = request.env["omniauth.auth"]

		authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		if  authentication
			user = authentication.user
			authentication.update_token(auth_hash)
			
			@notice = "Signed in!"
		else

			user = User.create_with_auth_hash(auth_hash)
			user = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]).user
			@notice = "User created - confirm or edit details..."
			
		end

		sign_in(user)
		redirect_to session[:prev], :notice => @notice
	end
end
