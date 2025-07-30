require 'httparty'
require 'nokogiri'
require 'cgi'

class BikeScraperIndex
  def self.listing_urls(_query = "")
    [
      "https://buycycle.com/en-de/product/rail-98-xt-gen-4-2024-82466",
      "https://buycycle.com/en-de/product/rail-98-gx-axs-gen-4-2023-47187",
      "https://buycycle.com/en-de/product/rail-99-xx1-axs-2022-76754",
      "https://buycycle.com/en-de/product/lux-trail-cf-6-2023-44867",
      "https://buycycle.com/en-de/product/rail-99-x0-axs-t-type-gen-4-2024-97803"
    ]
  end
end
