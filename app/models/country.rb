class Country < ApplicationRecord
  has_many :countries_trip
  has_many :trips, through: :countries_trip
end
