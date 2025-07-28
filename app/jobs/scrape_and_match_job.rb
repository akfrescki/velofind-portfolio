class ScrapeAndMatchJob < ApplicationJob
  queue_as :default

  def perform(bike_id)
    bike = Bike.find(bike_id)

    urls = BikeScraperIndex.listing_urls("#{bike.brand} #{bike.model}")

    urls.each do |url|
      listing_data = BikeScraperDetail.scrape(url)

      score = 80 # stub match score for now

      Match.create!(
        bike: bike,
        marketplace_url: listing_data[:marketplace_url],
        match_score: score,
        marketplace: listing_data[:marketplace],
        price: listing_data[:price],
        seller: listing_data[:seller],
        location: listing_data[:location]
      )
    end
  end
end
