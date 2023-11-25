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


    @appointments = Appointment.where(activity_id: @activity.id)

    @users = []
    @appointments.each do |appointment|
      trip = Trip.find(appointment.trip.id)
      user = User.find(trip.user.id)
      @users << user
    end

    client = OpenAI::Client.new


    @users.each do |user|
      pets_chat = user.pets.map do |pet|
        {
          role: "user",
          content: "Tell me how well #{pet.name}, a #{pet.breed}, gets along with other pets. Give a playful rating (0 to 100) for their potential to have fun together. Also, suggest some activities they can do to enjoy each other's company, using #{pet.details} as mains reference. Be concise and specific, using bullet points for each dog."
        }
      end

      chat_response = client.chat(parameters: {
        model: "gpt-3.5-turbo",
        messages: pets_chat
      })

      # Extract the assistant's response for the current user's pets
      @content = chat_response["choices"][0]["message"]["content"]

      # # Do something with the assistant_response, like storing it for later use or displaying it to the user
      # puts "Assistant response for #{user.name}'s pets: #{assistant_response}"
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
    params.require(:activity).permit(:title, :subtitle, :address, :city_id, :details, :photo)
  end
end
