class Station < ApplicationRecord
  has_many :stations_zones
  has_many :zones, -> { order(zone_number: :asc) }, through: :stations_zones
  validates :zones, presence: true
end
