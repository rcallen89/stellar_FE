class SolarSystemController < ApplicationController
  def show
    @object = SolarSystemFacade.new(params[:search])
  end
end
