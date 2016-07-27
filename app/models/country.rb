class Country < ActiveRecord::Base

	include PgSearch
	multisearchable :against => :description

	validates :description, uniqueness: true

	has_many :listings
	has_many :states
	has_many :cities
end
