class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new()
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    @activity.save!
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :subtitle, :address, :city_id, :details)
  end
end

