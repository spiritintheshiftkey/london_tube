class Journey < ApplicationRecord
  belongs_to :entry_station, class_name: 'Station', foreign_key: 'entry_station_id', optional: true
  belongs_to :exit_station, class_name: 'Station', foreign_key: 'exit_station_id', optional: true
  belongs_to :oyster_card
end
