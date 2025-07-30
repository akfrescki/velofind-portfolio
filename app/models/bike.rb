class Bike < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many_attached :pictures
  has_one :order

  validates :brand, :model, :stolen_date, :location_lost, :status, :first_search_date, presence: true

  def find_matches(listings)
    listings.each do |listing|
      match_score, matched_fields = calculate_match_score(listing)

      # if no fram number, match gets 85% max
      unless matched_fields.include?("frame_number")
        match_score = [match_score, 85].min
      end

      # it will not show matches bellow 70
      next if match_score < 70

      # will skip duplicates
      existing = matches.find_by(marketplace_url: listing[:url])
      next if existing.present?

      # create new match in DB
      matches.create!(
        marketplace_url: listing[:url],
        match_score: match_score,
        marketplace: listing[:marketplace],
        price: listing[:price],
        seller: "Unknown",
        location: listing[:location],
        matched_fields: matched_fields
      )
    end
  end

  private

  def calculate_match_score(listing)
    score = 0
    matched = []

    if listing[:frame_number].present? && listing[:frame_number].to_s.downcase == frame_number.to_s.downcase
      score += 100
      matched << "frame_number"
    else
      matched << "brand"     if listing[:brand].to_s.downcase == brand.to_s.downcase && (score += 40)
      matched << "model"     if listing[:model].to_s.downcase == model.to_s.downcase && (score += 40)
      matched << "color"     if listing[:color].to_s.downcase == color.to_s.downcase && (score += 10)
      matched << "location"  if listing[:location].to_s.downcase == location_lost.to_s.downcase && (score += 10)
    end

    [score, matched]
  end
end
