class SolarSystemFacade
  attr_reader :data

  def initialize(query)
    @data = StellarService.search(query)
  end

  def name
    @data[:englishName]
  end

  def planet?
    if @data[:isPlanet]
      "Yes"
    else
      "No"
    end
  end

  def around_planet
    @data[:aroundPlanet]
  end

  def discovered_by
    "N/A" unless @data[:discoveredBy] != ""
  end

  def discovered_on
    "N/A" unless @data[:discoveryDate] != ""
  end

  def moons
    if @data[:moons]
      @data[:moons].count
    else
      0
    end
  end

  def mass
    @data[:mass]
  end

  def volume
    @data[:vol]
  end

  def density
    @data[:density]
  end

  def gravity
    @data[:gravity]
  end
end
