class CarMake < ApplicationRecord
  	has_many :proposals
  	
  	belongs_to :car_year, optional: true
	has_many :car_models
	has_many :car_trims
	has_many :car_colors
end
