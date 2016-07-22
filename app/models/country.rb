class Country < ActiveRecord::Base

	validates :description, uniqueness: true

	has_and_belongs_to_many :listings
	has_many :states
	has_many :cities
end
