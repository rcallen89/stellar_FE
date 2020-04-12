class StellarService

  def search(query)
    response = Faraday.get("https://stellar-be.herokuapp.com/search?query=#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end

end