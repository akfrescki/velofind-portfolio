class Bike < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many_attached :pictures
  has_one :order

  validates :brand, :model, :stolen_date, :location_lost, :status, :first_search_date, presence: true

  def find_matches(listings)
    listings.map do |listing|
      # check frame number match
      bike_frame = frame_number&.downcase
      listing_frame = listing[:frame_number]&.downcase

      if bike_frame.present? && listing_frame.present? && bike_frame == listing_frame
        # confirmed match
        next { listing: listing, match_score: 100 }
      end

      score = 0

      # brand max 40%
      if brand.present? && listing[:brand].present?
        bike_words = brand.downcase.split
        listing_words = listing[:brand].downcase.split
        score += 40 if (bike_words & listing_words).any?
      end

      # model max 40%
      if model.present? && listing[:model].present?
        bike_words = model.downcase.split
        listing_words = listing[:model].downcase.split
        score += 40 if (bike_words & listing_words).any?
      end

      # color max 5%
      if color.present? && listing[:color].present?
        score += 5 if color.downcase == listing[:color].downcase
      end

      # can go max of 85 points in case of no frame number match
      score = [score, 85].min

      # if score is below 70%, skip this listing
      next if score < 70

      # returns a hash with the listing and the match score
      { listing: listing, match_score: score }
    end.compact
  end
end
