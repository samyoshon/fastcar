class CarMake < ApplicationRecord
  	belongs_to :car_year
	has_many :car_models
	has_many :car_trims
	has_many :car_colors
end