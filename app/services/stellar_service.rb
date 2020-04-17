class StellarService

  def self.search(query)
    Rails.cache.fetch('search_results', :expires_in => 12.hours) do
      response = Faraday.get("https://stellar-be.herokuapp.com/search?query=#{query}")
      if response.body.include?("Internal Server Error")
        nil
      else
        JSON.parse(response.body, symbolize_names: true)
      end
    end
  end

  def self.image_of_day
    Rails.cache.fetch('image_of_the_day', :expires_in => 12.hours) do
      response = Faraday.get("https://stellar-be.herokuapp.com/iotd")
      JSON.parse(response.body, symbolize_names: true)
    end
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
