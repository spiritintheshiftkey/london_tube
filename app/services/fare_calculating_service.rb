class FareCalculatingService
  def max_fare_pence
    320
  end

  def bus_fare_pence
    180
  end

  def fare_between_stations_pence(origin, destination)
    origin_zones = origin.zones.pluck(:zone_number)
    destination_zones = destination.zones.pluck(:zone_number)
    # Zone numbers will be in order (see Station.zones relation)
    if origin_zones.last < destination_zones.first
      # Outbound trip
      # min zone distance for customer is highest origin zone to lowest destination zone
      min_zone_distance = destination_zones.first - origin_zones.last
    elsif origin_zones.first > destination_zones.last
      # Inbound trip
      # min zone distance for customer is lowest origin zone to highest destination zone
      min_zone_distance = origin_zones.first - destination_zones.last
    else
      # Since lists are ordered, this means there is overlap in the lists
      min_zone_distance = 0
    end

    case min_zone_distance
    when 0
      # Within same zone
      if origin_zones.first == 1
        250
      else
        200
      end
    when 1
      # Covering 2 zones
      if origin_zones.first == 1 || destination_zones.first == 1
        300
      else
        225
      end
    when 2
      320
    else
      # Error to encourage future devs to add cases here when expanding number of zones
      raise 'Invalid journey, only journeys of up to 3 zones are supported'
    end
  end
end