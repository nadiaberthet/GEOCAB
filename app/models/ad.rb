class Ad < ApplicationRecord
  after_validation :geocode
  geocoded_by :address
end
