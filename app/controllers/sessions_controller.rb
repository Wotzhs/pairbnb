class SessionsController < Clearance::SessionsController
	def create_from_omniauth
		auth_hash = request.env["omniauth.auth"]

		authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		if  authentication
			user = authentication.user
			authentication.update_token(auth_hash)
			@next = root_path
			@notice = "Signed in!"
		else

			user = User.create_with_auth_hash(auth_hash)
			user = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]).user
			@next = root_path
			@notice = "User created - confirm or edit details..."
			
		end

		sign_in(user)
		redirect_to @next, :notice => @notice
	end
end
