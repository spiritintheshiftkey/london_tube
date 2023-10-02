class CreateJoinTableStationZone < ActiveRecord::Migration[7.0]
  create_join_table :stations, :zones do |t|
    t.index [:station_id, :zone_id]
  end
end
