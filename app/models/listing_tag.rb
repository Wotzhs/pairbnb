class ListingTag < ActiveRecord::Base

	validates :listing_id, uniqueness: {scope: :tag_id}
end
