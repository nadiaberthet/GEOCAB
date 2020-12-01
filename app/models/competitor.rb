class Competitor < ApplicationRecord
  geocoded_by :address

  def address
  end
end
