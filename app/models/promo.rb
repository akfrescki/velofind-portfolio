class Promo < ApplicationRecord
  validates :name, :description, :promocode, :website_url, presence: true
end
