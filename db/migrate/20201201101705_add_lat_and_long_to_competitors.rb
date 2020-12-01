class AddLatAndLongToCompetitors < ActiveRecord::Migration[6.0]
  def change
    add_column :competitors, :longitude, :float
    add_column :competitors, :latitude,   :float
  end
end
