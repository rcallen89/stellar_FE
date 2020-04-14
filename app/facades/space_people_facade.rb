class SpacePeopleFacade

  attr_reader :data

  def initialize
    @data = StellarService.get_people
  end
end
