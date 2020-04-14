class SunMoonFacade

  attr_reader :data

  def initialize(location)
    @data = SunMoonService.get_data(location)
  end

  def zone
    @data[:zone]
  end

  def localtime
    @data[:localtime]
  end

  def sunrise
    @data[:sunrise]
  end

  def sunset
    @data[:sunset]
  end

  def moonrise
    @data[:moonrise]
  end

  def moonset
    @data[:moonset]
  end

  def moon_phase
    @data[:moon_phase]
  end

  def moon_illumination
    @data[:moon_illumination]
  end
end
