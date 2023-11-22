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

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :subtitle, :address, :city_id, :details, :photo)
  end
end
