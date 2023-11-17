class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    @pet.save!
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :size, :breed, :details)
  end
end
