class PlacesController < ApplicationController

  def index
    @city = City.find(params[:city_id])
    @places = @city.places

    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end

  def new
    @place = Place.new
    @city = City.find(params[:city_id])
  end

  def create
    @city = City.find(params[:city_id])
    @place = Place.new(place_params)
    @place.city = @city
    @place.user = current_user
    if @place.save
      redirect_to city_places_path(@city)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to city_places_path(@place.city)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def place_params
    params.require(:place).permit(:title, :subtitle, :address, :pricing, :rooms, :details, :city_id, :photo)
  end
end
