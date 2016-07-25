class Reservation < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user

	validates :start_date, presence: true
	validates :end_date, presence: true
	validate :check_dates

	private
	def check_dates
		errors.add(:start_date, 'is after end date') if start_date > end_date
		errors.add(:end_date, 'is before start date') if end_date < start_date
	end
end
