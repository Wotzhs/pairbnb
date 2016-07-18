class User < ActiveRecord::Base
  include Clearance::User

  validates :email, uniqueness: true

end
