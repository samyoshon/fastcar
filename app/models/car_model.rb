class CarModel < ApplicationRecord
	belongs_to :car_year
	belongs_to :car_make
	has_many :car_trims
	has_many :car_colors
end
