require 'open-uri'
require 'json'
class ApiInsee
  def donne_demo(ville)
    url = 'https://api.insee.fr/donnees-locales/V0.1/donnees/geo-TF4@RP2015/COM-44109.all'
    demo_serialized = open(url).read
    ville = JSON.parse(demo_serialized)
  end
  donne_demo(puts "#{demo_serialized} - #{ville}")
end
