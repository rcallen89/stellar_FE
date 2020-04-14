class SolarSearchController < ApplicationController

  def search
  end

  def show
    @sun_moon_facade = SunMoonFacade.new(params[:location])
  end
end
