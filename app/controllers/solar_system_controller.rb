class SolarSystemController < ApplicationController
  before_action :require_user

  def show
    @object = SolarSystemFacade.new(params[:search])
    if @object.data == nil
      flash[:notice] = "We're sorry, we could not find what you were looking for."
      redirect_to "/"
    end
  end
end
