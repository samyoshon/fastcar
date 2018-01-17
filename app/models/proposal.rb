class Proposal < ApplicationRecord
	include HTTParty
	belongs_to :user, optional: true
	belongs_to :car_make, optional: true
	belongs_to :car_model, optional: true
	has_many :responses
end

