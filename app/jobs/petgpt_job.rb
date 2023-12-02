class PetgptJob < ApplicationJob
  queue_as :default

  def perform(activity_id)
    @activity = Activity.find(activity_id)

    @appointments = Appointment.where(activity_id: @activity.id)

    # Retrieving users that have appointments in their trip in the same activity and saving in an array
    @users = []
    @appointments.each do |appointment|
      trip = Trip.find(appointment.trip.id)
      user = User.find(trip.user.id)
      @users << user unless @users.include?(user)
    end

    # Creating prompts to send to ChatGPT
    pets_chat = []
    @users.each do |user|
      user.pets.each do |pet|
        content = "Give me 10 words about #{pet.name}, using its #{pet.breed} breed and #{pet.details}."
        pets_chat << content
      end
    end

    client = OpenAI::Client.new
    chat_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "#{pets_chat}. Give your opinion on how the interaction between these dogs will work, and which dog needs more attention to avoid mishaps. Use less than 120 words." }]
    })

    @activity.update(response: chat_response["choices"][0]["message"]["content"])
  end
end


