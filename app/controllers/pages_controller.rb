class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @city = City.all
    @activities = Activity.all
  end

end
