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
      @users << user unless @users.include?(user)
    end


    # pets_chat = []
    # @users.each do |user|
    #   user.pets.map do |pet|
    #     content = "Give me a 10 words about #{pet.name}, using its #{pet.breed} breed and #{pet.details}."
    #     pets_chat << content
    #   end
    # end

    # client = OpenAI::Client.new
    # chat_response = client.chat(parameters: {
    #   model: "gpt-3.5-turbo",
    #   messages:  [ {role: "user", content: "#{pets_chat}. Give your opinion on how the interaction between these dogs will work, and which dog needs more atention to avoid mishaps. Use less than 120 words."} ]
    # })

    # @content = chat_response["choices"][0]["message"]["content"]

    #demora p carrega -> background job?
    #só para fazer as requisições -> o que ele retornar e criar a mensagem -> criar no meeting.
      #quando logasse, 10 em 10 minutos

    #das pessoas estarem conversando, e guardar o conteúdo - a pessoa entrar na sala.
    #biblioteca de mensagens, que estão prontas - vai consultar o chatgpt - não vai criar, deixa como gatilho entrar na sala
      #roda outro worker que vai rodar as mensagens em tempo real
    #tá um caos esse rolê

    #after create
    #fazer o broadcast depois, pode fazer - na hora que logar a pessoa vê.

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
