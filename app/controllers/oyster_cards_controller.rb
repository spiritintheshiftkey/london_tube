class OysterCardsController < ApplicationController
  skip_before_action :verify_authenticity_token # Just to allow easy cURL testing
  before_action :reject_invalid_amount_pounds, only: [:create, :update]
  
  def create    
    created_card = OysterCard.create!(balance_pence: params[:amount_pounds].to_i * 100)
    render json: { id: created_card.id }, status: :created
  end

  def show
    render json: { balance: oyster_card.balance_pounds }
  end

  def update
    oyster_card.add_pounds(params[:amount_pounds].to_i)
    render json: { balance: oyster_card.balance_pounds }, status: :accepted
  end

  def enter_station
    StationProcessingService.new(oyster_card, station).enter_station

    render json: { balance: oyster_card.balance_pounds }, status: :accepted
  end

  def leave_station
    StationProcessingService.new(oyster_card, station).leave_station
        
    render json: { balance: oyster_card.balance_pounds }, status: :accepted
  end

  def ride_bus
    # Still need to consider offline capabilities here
    oyster_card.charge(FareCalculatingService.new.bus_fare_pence)

    render json: { balance: oyster_card.balance_pounds }, status: :accepted
  end

  private

  def oyster_card
    OysterCard.find(params[:id])
  end

  def station
    if params[:station_name].present?
      Station.find_by!(name: params[:station_name])
    else
      Station.find(params[:station_id])
    end
  end

  def reject_invalid_amount_pounds
    head :unprocessable_entity unless params[:amount_pounds] && params[:amount_pounds].to_i > 0
  end
end
