class SunMoonService

  def self.get_data(location)
    response = Faraday.get("http://stellar-be.herokuapp.com/astronomy?query=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
