class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @cities = City.all
    @activities = Activity.all
  end

end
