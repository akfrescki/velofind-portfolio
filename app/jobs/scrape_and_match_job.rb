class ScrapeAndMatchJob < ApplicationJob
  queue_as :default

  def perform(bike_id)
    bike = Bike.find(bike_id)

    # scrape fresh listings
    ScrapeAndSeedListingsJob.perform_now("")

    # Prepare listing hashes for matching
    listings = Listing.all.map do |l|
      {
        url: l.marketplace_url,
        brand: l.brand,
        model: l.model,
        frame_number: l.frame_number,
        color: l.color,
        location: l.location,
        marketplace: l.marketplace,
        price: l.price,
        seller: l.seller.presence || "Unknown"
      }
    end

    # Run match logic
    bike.find_matches(listings)
  end
end
