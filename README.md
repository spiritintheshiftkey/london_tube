# README

Ensure you have Ruby 3 and SQLite (standard setup for app made with rails generator)

Run `bin/rails db:migrate && bin/rails db:seed` to set up data

Run `bin/rails server` to start the server

USAGE:

View Oyster Card balance:

`curl localhost:3000/oyster_cards/1`

Add funds:

`curl -X PATCH -d "amount_pounds=30" localhost:3000/oyster_cards/1`

Ride any bus:
`curl -X POST localhost:3000/oyster_cards/1/ride_bus`

Enter a station:
`curl -X POST -d "station_name=Holburn" localhost:3000/oyster_cards/1/enter_station`

Exit a station:
`curl -X POST -d "station_name=Earl’s Court" localhost:3000/oyster_cards/1/leave_station`

Create a new Oyster Card:
`curl -X POST -d "amount_pounds=30" localhost:3000/oyster_cards`

Additional examples for testing:
`curl -X POST -d "station_name=Chelsea" localhost:3000/oyster_cards/1/enter_station`
`curl -X POST -d "station_name=Wimbledon" localhost:3000/oyster_cards/1/leave_station`
