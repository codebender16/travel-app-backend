class Trip < ApplicationRecord
  has_many :countries
  has_many :countries, through: :countries_trip
end
