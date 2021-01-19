class CompetitorsApiJob < ApplicationJob
  queue_as :default

  def perform(search)
    places = search_places(search)
    places.each do |place|
      longitude = place.lng
      latitude = place.lat

      Competitor.find_or_create_by(
        latitude: latitude,
        longitude: longitude
      )
    end
  end

  private

  def search_places(search)
    client = GooglePlaces::Client.new(ENV["PLACES_API_KEY"])
    places = client.spots(search.latitude, search.longitude, name: 'Kinésithérapeute', radius: 10_000, multipage: true)
    return places
  end
end
