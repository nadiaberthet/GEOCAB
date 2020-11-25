class Search < ApplicationRecord
  belongs_to :user
  after_validation :geocode

  geocoded_by :query
end
