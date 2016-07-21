Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["fb_app_id"], ENV["fb_app_secret"],
  scope: 'public_profile', info_fields: 'first_name,last_name,email,birthday'
end
