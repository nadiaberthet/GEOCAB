class Search < ApplicationRecord
  belongs_to :user, optional: true
  after_validation :geocode

  geocoded_by :query
end
