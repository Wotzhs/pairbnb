class Reservation < ActiveRecord::Base

	scope :ordered, -> { order(start_date: :asc)}

	belongs_to :listing
	belongs_to :user

	validates :start_date, presence: { strict: true }
	validates :end_date, presence: { strict: true }
	validate :check_dates

	private
	def check_dates
		errors.add(:start_date, 'is after end date') if start_date > end_date
	end
end
