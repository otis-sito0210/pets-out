class TripsController < ApplicationController

  def new
    @place = Place.find(params[:place_id])
    @trip = Trip.new()
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save!
      redirect_to trip_activities_path(@trip.id)
    end

  end

  def my_trips_index
    @trips = Trip.where(user_id: current_user.id)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :place_id)
  end

end
