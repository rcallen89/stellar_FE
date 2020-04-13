class WelcomeController < ApplicationController
  def index
    @iotd = ImageOfDay.new(StellarService.image_of_day)
  end
end
