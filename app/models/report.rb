class Report < ApplicationRecord
  belongs_to :bike

  validates :bike_id, :content, presence: true
end
