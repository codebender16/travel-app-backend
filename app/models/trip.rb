class Trip < ApplicationRecord
  has_many :countries_trip
  has_many :countries, through: :countries_trip
end
