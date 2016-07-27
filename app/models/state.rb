class State < ActiveRecord::Base

	include PgSearch
	multisearchable :against => :description

	validates :description, uniqueness: true

	has_many :listings
	has_many :cities
	belongs_to :country
end
