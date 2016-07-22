class Listing < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :country
	belongs_to :state
	belongs_to :city
	has_many :reservations
	has_many :tags, through: :listing_tags

end
