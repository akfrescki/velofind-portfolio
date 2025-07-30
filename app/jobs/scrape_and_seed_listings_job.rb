class ScrapeAndSeedListingsJob < ApplicationJob
  queue_as :default

  def perform(query)
    urls = BikeScraperIndex.listing_urls(query)

    urls.each do |url|
      listing_data = BikeScraperDetail.scrape(url)

      Listing.create!(
        brand: listing_data[:brand],
        model: listing_data[:model],
        color: listing_data[:color],
        frame_number: listing_data[:frame_number],
        marketplace: listing_data[:marketplace],
        marketplace_url: listing_data[:marketplace_url],
        price: listing_data[:price],
        seller: listing_data[:seller],
        location: listing_data[:location],
        image_url: listing_data[:image_url]
      )
    end
  end
end
