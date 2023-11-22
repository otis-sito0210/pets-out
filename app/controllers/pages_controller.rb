class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @cities = City.all
    @activities = Activity.all

    if params[:query].present?
      city = City.find_by(local: params[:query])

      if city.present?
        @activities = city.activities
      else
        flash[:notice] = "City not found."
      end
    end
  end
end
