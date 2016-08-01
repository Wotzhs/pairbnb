class Payment < ActiveRecord::Base
	belongs_to :user
	belongs_to :lisitng
	belongs_to :reservation
end
