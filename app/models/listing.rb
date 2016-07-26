class Listing < ActiveRecord::Base

	mount_uploader :cover, ImageUploader
	mount_uploaders :images, ImageUploader
	
	belongs_to :user
	belongs_to :country
	belongs_to :state
	belongs_to :city
	has_many :reservations
	has_many :tags, through: :listing_tags
	has_many :reservations

	validates :user_id, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :country_id, presence: true
	validates :state_id, presence: true
	validates :city_id, presence: true
	validate :check_inputs


	private
	def check_inputs
	end

end
