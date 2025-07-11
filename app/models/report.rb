class Report < ApplicationRecord
  belongs_to :bike
  belongs_to :match


  validates :match, presence: true
  validates :bike_id, :content, presence: true
end
