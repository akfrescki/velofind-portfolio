class Bike < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many :reports

  validates :brand, :model, :stolen_date, :location_lost, :status, :first_search_date, presence: true
end
