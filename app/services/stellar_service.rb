class StellarService

  def search(query)
    response = Faraday.get("https://stellar-be.herokuapp.com/search?query=#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.image_of_day
    response = Faraday.get("https://stellar-be.herokuapp.com/iotd")
    JSON.parse(response.body, symbolize_names: true)
  end
end