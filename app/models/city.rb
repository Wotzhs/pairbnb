class City < ActiveRecord::Base

	validates :description, uniqueness: true

	has_and_belongs_to_many :listings
	belongs_to :state
	belongs_to :country
end
