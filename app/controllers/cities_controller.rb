class CitiesController < ApplicationController
  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    # @city.user = current_user
    if @city.save!
      redirect_to root_path, notice: 'City was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      redirect_to root_path, notice: 'City was successfully updated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def city_params
    params.require(:city).permit(:local, :photo)
  end
end
