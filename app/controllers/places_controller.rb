class PlacesController < ApplicationController

  def new
    @place = Place.new()
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    @place.save!

    # if params[:photos]
    #   params[:photos].each do |photo|
    #     @place.photos.attach(photo)
    #   end
    # end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)

    # if params[:photos]
    #   params[:photos].each do |photo|
    #     @place.photos.attach(photo)
    #   end
    # end
  end


  def index
    @city = City.find(params[:city_id])
    @places = @city.places
  end

  private

  def place_params
    params.require(:place).permit(:title, :subtitle, :address, :pricing, :rooms, :details, :city_id, :photo)
  end
end
