class TripsController < ApplicationController

  def new
    @place = Place.find(params[:place_id])
    @trip = Trip.new
  end

  def create
    @place = Place.find(params[:place_id])
    @trip = Trip.new(trip_params)
    @trip.place = @place
    @trip.user = current_user

    # if params[:trip][:start_date].present? && params[:trip][:end_date].present?
    #   @trip.start_date = params[:trip][:start_date]
    #   @trip.end_date = params[:trip][:end_date]
    # end

    respond_to do |format|
      if @trip.save!
        puts "created"
        format.html { redirect_to trip_activities_path(@trip.id) }
        format.json # Follows the classic Rails flow and look for a create.json view
      else
        format.html { render "trips/form", status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
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
