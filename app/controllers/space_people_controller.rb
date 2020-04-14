class SpacePeopleController < ApplicationController
  before_action :require_user

  def index
    @space_people_facade = SpacePeopleFacade.new
  end
end
