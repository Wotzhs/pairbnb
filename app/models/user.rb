class User < ActiveRecord::Base
  include Clearance::User

  validates :email, uniqueness: true

  has_many :authentications, :dependent => :destroy
  has_many :listings

  def self.create_with_auth_hash(auth_hash)
  	@user = User.new
  	@user.first_name = auth_hash["extra"]["raw_info"]["first_name"]
  	@user.last_name = auth_hash["extra"]["raw_info"]["last_name"]
  	@user.email = auth_hash["extra"]["raw_info"]["email"]
  	@user.date_of_birth = Date.parse(auth_hash["extra"]["raw_info"]["birthday"]).strftime("%m/%d/%Y")
  	@user.encrypted_password = ENV["3rd_party_sign_up"]
  	if @user.save
  		@user.authentications.create_with_omniauth(auth_hash)
  	end
  end

  def fb_token
  	x = self.authentications.where(:provider => :facebook).first
  	return x.token unless x.nil?
  end

  def password_optional?
  	true
  end

end
