class Ad < ApplicationRecord
  validates :address, format: { with: /\S\S\W*((?i)Arrondissement(?-i))\W*/ }
end
