class SpacePeopleController < ApplicationController
  def index
    @space_people_facade = SpacePeopleFacade.new
  end
end
