class StellarService

  def self.search(query)
    response = Faraday.get("https://stellar-be.herokuapp.com/search?query=#{query}")
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.image_of_day
    response = Faraday.get("https://stellar-be.herokuapp.com/iotd")
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.get_data(location)
    response = Faraday.get("https://stellar-be.herokuapp.com/astronomy?query=#{location}")
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.get_people
    response = Faraday.get('https://stellar-be.herokuapp.com/people-in-space')
    JSON.parse(response.body, symbolize_names: true)[:data]
  end
end
