require 'httparty'
require 'nokogiri'

class BikeScraperDetail
  def self.scrape(url)
    response = HTTParty.get(url)
    page = Nokogiri::HTML(response.body)
    puts page

    {
      brand: extract_brand(page),
      model: extract_model(page),
      color: extract_color(page),
      marketplace: "Buycycle",
      marketplace_url: url,
      price: extract_price(page),
      seller: extract_seller(page),
      location: extract_location(page),
      image_url: extract_image(page)
    }
  end

  def self.extract_brand(page)
    page.at_css('span.text-contentSecondary.font-regular.text-base')&.text&.strip
  end

  def self.extract_model(page)
    page.at_css('h1.text-contentPrimary.font-medium.text-2xl')&.text&.strip
  end

  def self.extract_color(page)
    color_span = page.at_css('span.w-4.h-4.rounded-full')
    style = color_span&.[]('style')
    return nil unless style

    match = style.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/)
    return nil unless match

    "rgb(#{match[1]}, #{match[2]}, #{match[3]})"
  end

  def self.extract_price(page)
    page.at_css('span.text-contentPrimary.font-medium.text-2xl.lg\\:text-2xl')&.text&.strip
  end

  def self.extract_seller(page)
    seller = page.at_css('span.underline')&.text
    seller&.strip || "Anonymous Seller"
  end

  def self.extract_location(page)
    page.at_css('p.font-regular.text-sm.text-contentPrimary.mt-1')&.text&.strip
  end

  def self.extract_image(page)
    image = page.at_css('img[src*="/uploads/bike/media"]')
    image['src'] if image
  end
end
