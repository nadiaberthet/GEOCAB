require 'rest-client'
require 'nokogiri'
require 'pry'

class BoncoinScraper
  def scrap
    # response = RestClient.get(url, headers)
    body = File.open("#{Rails.root}/boncoin.html")
    doc = Nokogiri::HTML(body)
    doc.search('._2-MzW').first(5).each do |ad|
      title   = ad.search('.Msj0v').text
      address = ad.search('._1UzWr:nth-child(2)').text
      rent_cents = ad.search('._1C-CB').text
      published_at = ad.search('._1UzWr:nth-child(3)').text
      image_url = ad.attr('image')

      # Ad.create(
      #   title: title,
      #   address: address,
      #   rent_cents: rent_cents,
      #   published_at: published_at,
      #   image_url: image_url
      # )
      puts title
      puts address
      puts rent_cents
      puts published_at
      puts image_url
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
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'
    }
  end
end
