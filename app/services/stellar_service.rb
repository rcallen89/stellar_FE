class StellarService

  def search(query)
    response = Faraday.get("https://stellar-be.herokuapp.com/search?query=#{query}")
    if response.body.include?("Internal Server Error")
      nil
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.image_of_day
    response = Faraday.get("https://stellar-be.herokuapp.com/iotd")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_data(location)
    response = Faraday.get("http://stellar-be.herokuapp.com/astronomy?query=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_people
    response = Faraday.get('http://stellar-be.herokuapp.com/people-in-space')
    JSON.parse(response.body, symbolize_names: true)
  end
end
