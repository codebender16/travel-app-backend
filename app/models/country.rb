class Country < ApplicationRecord
  has_many :trips
  has_many :trips, through: :countries_trip
end
