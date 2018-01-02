class CarColor < ApplicationRecord
	belongs_to :car_year
	belongs_to :car_make
	belongs_to :car_model
	belongs_to :car_trim
end
