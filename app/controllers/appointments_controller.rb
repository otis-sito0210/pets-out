class AppointmentsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.find(params[:activity_id])
    @appointment = Appointment.new()
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save!
      redirect_to my_trips_path, notice: 'Trip was successfully updated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :hour, :trip_id, :activity_id)
  end
  
end
