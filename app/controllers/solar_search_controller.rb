class SolarSearchController < ApplicationController
  before_action :require_user

  def search
  end

  def show
    @sun_moon_facade = SunMoonFacade.new(params[:location])
  end
end
