class CarTrim < ApplicationRecord
  belongs_to :car_year
  belongs_to :car_make
  belongs_to :car_model
  has_many :car_colors
end
