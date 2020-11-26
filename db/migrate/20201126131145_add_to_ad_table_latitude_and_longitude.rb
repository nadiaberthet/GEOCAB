class AddToAdTableLatitudeAndLongitude < ActiveRecord::Migration[6.0]
  def change
    add_column :ads, :longitude, :float
    add_column :ads, :latitude,   :float
  end
end
