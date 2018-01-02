class Proposal < ApplicationRecord
	include HTTParty
	belongs_to :user
	belongs_to :car_make
	belongs_to :car_model
	has_many :responses
end

