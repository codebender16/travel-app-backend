class TripsController < ApplicationController
  before_action :find_trip, only: %i[show update destroy]

  def index
    @trips = Trip.all
    render json: @trips
  end

  def show
    render json: @trip
  end

  def create
    trip = Trip.new(trip_params)
    if(trip.save)
      render header: :created
    else
      render json: {error: trip.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update 
    if @trip.update(trip_params)
      render status: :no_content
    else
      render json: {error: @trip.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.delete
    render status: :no_content
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :airline, :year)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
