require 'nokogiri'
require 'byebug'
require 'open-uri'

def all_ads
  url = 'http://www.annoncesparamedicales.com/jsp/annoncesParVille_lyon.html'

  html_file = open(url).read
  html_doc  = Nokogiri::HTML(html_file)

  html_doc.search('.annonce_search_container"').each do |element|
    puts element.text
    puts element.attribute('href').value
  end
end
