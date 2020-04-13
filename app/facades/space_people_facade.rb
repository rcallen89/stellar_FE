class SpacePeopleFacade

  attr_reader :data

  def initialize
    @data = SpacePeopleService.get_data
  end

  def names
    @data.map {|object| object[:name]}
  end

  def crafts
    @data.map {|object| object[:craft]}
  end
end
