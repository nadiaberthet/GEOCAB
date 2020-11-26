class Ad < ApplicationRecord
  validates :address, format: { with: /\S\S\W*((?i)Arrondissement(?-i))\W*/ }
  after_validation :geocode

  geocoded_by :address
end
