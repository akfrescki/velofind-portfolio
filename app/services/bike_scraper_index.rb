require 'httparty'
require 'nokogiri'

class BikeScraperIndex
  BASE_URL = 'https://buycycle.com/en-fr'

  def self.listing_urls(query = "")
    search_url = "#{BASE_URL}/bikes?search=#{URI.encode(query)}"
    response = HTTParty.get(search_url)
    page = Nokogiri::HTML(response.body)

    page.css('[data-cy="bike-card"] a').map do |a|
      path = a['href']
      path ? BASE_URL + path : nil
    end.compact.uniq
  end
end
