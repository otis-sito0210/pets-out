class AppointmentsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.find(params[:activity_id])
    @appointment = Appointment.new()
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.save!
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :hour, :trip_id, :activity_id)
  end
end
