class SolarSystemFacade
  attr_reader :data
  
  def initialize(query)
    @data = StellarService.new.search(query)
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
    @data[:discoveredBy]
  end

  def discovered_on
    @data[:discoveryDate]
  end

  def moons
    @data[:moons]
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
