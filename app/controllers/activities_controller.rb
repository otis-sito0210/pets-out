class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new()
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    @activity.save!
  end

  def index
    @trip = Trip.find(params[:trip_id])
    place = Place.find(@trip.place.id)
    @city = City.find(place.city.id)
    @activities = Activity.where(city_id: @city.id)
  end

  # def index_activities_on_city_id
  #   @activities = Activity.where(trip_id: params[:trip_id])
  #   @trip = Trip.find(params[:trip_id])
  # end

  private
  def activity_params
    params.require(:activity).permit(:title, :subtitle, :address, :city_id, :details)
  end
end
