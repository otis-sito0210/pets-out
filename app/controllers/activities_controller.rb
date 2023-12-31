class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new()
    @city = City.find(params[:city_id])
  end

  def create
    @city = City.find(params[:city_id])
    @activity = Activity.new(activity_params)
    @activity.city = @city
    @activity.user = current_user
    if @activity.save!
      redirect_to city_places_path(@city)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @trip = Trip.find(params[:trip_id])
    place = Place.find(@trip.place.id)
    @city = City.find(place.city.id)
    @activities = Activity.where(city_id: @city.id)
  end

  def show
    @activity = Activity.find(params[:id])
    @meeting = Meeting.new

    PetgptJob.perform_later(@activity.id)

    @appointments = Appointment.where(activity_id: @activity.id)

    @users = []
    @appointments.each do |appointment|
      trip = Trip.find(appointment.trip.id)
      user = User.find(trip.user.id)
      @users << user unless @users.include?(user)
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to city_places_path(@city)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def activity_params
    params.require(:activity).permit(:title, :subtitle, :address, :city_id, :details, :photo, :response)
  end
end
