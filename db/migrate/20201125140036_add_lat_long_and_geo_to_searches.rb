class AddLatLongAndGeoToSearches < ActiveRecord::Migration[6.0]
  def change
    add_column :searches, :latitude, :float
    add_column :searches, :longitude, :float
  end
end
