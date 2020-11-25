require 'rest-client'
require 'nokogiri'
require 'pry'

class BoncoinScraper
  def scrap
    response = RestClient.get(url, headers)
    doc = Nokogiri::HTML(response.body)
    doc.search('._3RVaT').first(5).each do |ad|
      title   = ad.search('.Msj0v').text
      address = ad.search('._1UzWr').text
      rent_cents = ad.search('._1qZ_s').text
      published_at = ad.search('._1UzWr').text
      image_url = ad.search('._29Lk0').text
      # Ad.create(
      #   title: title,
      #   address: address,
      #   rent_cents: rent_cents,
      #   published_at: published_at,
      #   image_url: image_url
      # )
    p address
    p rent_cents
    p published_at
    p image_url
    end
  end

  private

  def url
    'https://www.leboncoin.fr/recherche?category=13&text=param%C3%A9dical&locations=Lyon__45.760811535403114_4.836200501217434_7590'
  end

  def headers
    {
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
      'Accept-Encoding': 'br',
      'Accept-Language': 'en-US,en;q=0.9,fr;q=0.8,ru;q=0.7,de;q=0.6,it;q=0.5',
      'Cache-Control': 'no-cache',
      'Connection': 'keep-alive',
      'Host': 'www.leboncoin.fr',
      'Pragma': 'no-cache',
      'Sec-Fetch-Dest': 'document',
      'Sec-Fetch-Mode': 'navigate',
      'Sec-Fetch-Site': 'same-origin',
      'Sec-Fetch-User': '?1',
      'Upgrade-Insecure-Requests': '1',
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.67 Safari/537.36'
    }
  end
end
