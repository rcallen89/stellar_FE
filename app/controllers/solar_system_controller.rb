class SolarSystemController < ApplicationController
  before_action :require_user

  def show
    @object = SolarSystemFacade.new(params[:search])
  end
end
