class City < ActiveRecord::Base

	include PgSearch
	multisearchable :against => [:description]

	validates :description, uniqueness: true

	has_many :listings
	belongs_to :state
	belongs_to :country
end
