class SolarObject
  attr_reader :name,
              :planet,
              :moons,
              :discovered_by,
              :discovered_on,
              :gravity,
              :around_planet

  def initialize(api_data)
    return "No Data" if api_data.blank?
    @name = api_data[:data][:englishName]
    @planet = (api_data[:data][:isPlanet] == true ? "Yes" : "No")
    @moons = moon_list(api_data[:data][:moons])
    @around_planet = api_data[:data][:aroundPlanet]
    @discovered_by = (api_data[:data][:discoveredBy] == "" ? "Unknown" : api_data[:data][:discoveredBy])
    @discovered_on = (api_data[:data][:discoveryDate] == "" ? "Unknown" : api_data[:data][:discoveryDate])
    @gravity = api_data[:data][:gravity]
  end

  def moon_list(moons)
    return [] if moons.blank?
    moons.reduce(Hash.new) do |acc, moon|
      acc[moon[:moon]] = moon[:rel].split("/").last
      acc
    end
  end

end