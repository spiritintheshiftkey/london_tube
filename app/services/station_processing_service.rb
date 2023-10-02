class StationProcessingService
  def initialize(oyster_card, station)
    @oyster_card = oyster_card
    @station = station
  end

  def enter_station
    # Charge card max fare
    @oyster_card.charge(FareCalculatingService.new.max_fare_pence, @station)
  end

  def leave_station
    # Find placeholder fare
    journey = @oyster_card.journeys.first
    entry_station = journey&.entry_station
    # It shouldn't be possible to exit unless you entered (i.e. a charge with an entry station and no exit station should be first)
    # This code would allow people to leave without charge if we lost their record
    # Would need to discuss with product stakeholders how the edge case should be handled 
    return unless entry_station.present? & journey.exit_station.nil?
    # Calculate true fare based on entry and exit
    correct_fare_pence = FareCalculatingService.new.fare_between_stations_pence(entry_station, @station)
    refund_pence = journey.amount_pence - correct_fare_pence
    ActiveRecord::Base.transaction do
      @oyster_card.update!(balance_pence: @oyster_card.balance_pence + refund_pence)
      # Choosing to update the placeholder journey so that the timestamps represent the start and end of the trip
      journey.update!(amount_pence: correct_fare_pence, entry_station:, exit_station: @station)
    end
  end
end