class SolarSearchController < ApplicationController

  def search
  end

  def show
    @sun_moon_facade = SunMoonFacade.new(params[:location])
    if @sun_moon_facade.data == nil
      flash[:notice] = "Please enter a valid location. (city name, or city name and state)"
      redirect_to "/sun_and_moon_search"
    end
  end
end
