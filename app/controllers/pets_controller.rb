class PetsController < ApplicationController


  def index
    @pets = current_user.pets
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save!
      redirect_to pets_path, notice: 'Pet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    if @pet.save!
      redirect_to pets_path,  notice: 'Pet was successfully edited.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :size, :breed, :details, :user_id, :photo)
  end
end
