require 'httparty'
require 'nokogiri'
require 'byebug'
require 'json'
require 'open-uri'

#   ingredient =
#   url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

#   html_file = open(url).read
#   html_doc = Nokogiri::HTML(html_file)

#   html_doc.search('.standard-card-new__article-title').each do |element|
#     puts element.text.strip
#     puts element.attribute('href').value
# end

def all_ads
  unparsed_page = HTTParty.get('https://www.worldometers.info/coronavirus/')
  parsed_page = Nokogiri::HTML(unparsed_page)
end
