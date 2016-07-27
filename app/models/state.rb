class State < ActiveRecord::Base

	include PgSearch

	validates :description, uniqueness: true

	has_and_belongs_to_many :listings
	has_many :cities
	belongs_to :country
end
