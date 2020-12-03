class User < ApplicationRecord
  JOBS = %w[Infirmier Kinésithérapeute Médecin généraliste Ostéopathe Sage-Femme]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :searches

  def search_places
    client = GooglePlaces::Client.new(ENV["PLACES_API_KEY"])
    search = self.post_search
    places = client.spots(search.latitude, search.longitude, name: 'Kinésithérapeute', radius: 15_000, multipage: true)
    return places
  end

  def post_search
    return self.searches.last
  end

  def get_prog
    data = []
    data << self.cpam
    data << self.ordre
    data << self.retraite
    data << self.assurance_rcp
    data << self.urssaf
    data << self.cabinet
    data << self.materiel
    data << self.doctolib
    data << self.google_business
    number = data.count(true)
    rounded = number.fdiv(9)*100
    return rounded.round
  end
end