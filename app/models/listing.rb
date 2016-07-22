class Listing < ActiveRecord::Base
	
	belongs_to :user
	has_many :reservations
	has_many :tags, through: :listing_tags

end
