class SpacePeopleFacade

  attr_reader :data

  def initialize
    @data = SpacePeopleService.get_data
  end
end
