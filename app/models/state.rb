class State < ActiveRecord::Base

	validates :description, uniqueness: true

	has_and_belongs_to_many :listings
	has_many :cities
	belongs_to :country
end
