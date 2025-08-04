class Match < ApplicationRecord
  belongs_to :bike
  has_one :report, dependent: :destroy

  validates :match_score, presence: true
end
