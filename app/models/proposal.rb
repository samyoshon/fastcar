class Proposal < ApplicationRecord
	include HTTParty
	belongs_to :user
	has_many :responses
end

