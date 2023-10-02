class StationsZone < ApplicationRecord
  belongs_to :station
  belongs_to :zone

  validates :station_id, uniqueness: {
    scope: :zone_id
  }
end
