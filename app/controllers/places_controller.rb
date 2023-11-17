class PlacesController < ApplicationController

  def new
    @place = Place.new()
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    @place.save!
  end

  private

  def place_params
    params.require(:place).permit(:title, :subtitle, :address, :pricing, :rooms, :details, :city_id)
  end
end
