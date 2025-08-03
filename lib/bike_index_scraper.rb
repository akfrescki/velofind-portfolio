require 'httparty'

class BikeIndexScraper
  include HTTParty
  base_uri 'https://bikeindex.org:443/api/v3'

  def self.fetch_bikes_by_brand(brand:)
    response = get('/search', query: {
      manufacturer: brand,
      per_page: 100,
      page: 1
    })

    return [] unless response.success?

    response.parsed_response["bikes"]
  end
end
