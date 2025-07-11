class Match < ApplicationRecord
  belongs_to :bike

  validates :bike_id, :marketplace_url, :match_score, :marketplace, :price, :seller, presence: true
end
