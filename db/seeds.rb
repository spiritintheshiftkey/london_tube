# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

zone_1 = Zone.create!(zone_number: 1)
zone_2 = Zone.create!(zone_number: 2)
zone_3 = Zone.create!(zone_number: 3)

Station.create!(name: 'Holburn', zones: [zone_1])
Station.create!(name: 'Chelsea', zones: [zone_1])
Station.create!(name: 'Earl’s Court', zones: [zone_1, zone_2])
Station.create!(name: 'Wimbledon', zones: [zone_3])
Station.create!(name: 'Hammersmith', zones: [zone_2])

OysterCard.create!
