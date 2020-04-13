class SpacePeopleService
  def self.get_data
    response = Faraday.get('http://stellar-be.herokuapp.com/people-in-space')
    JSON.parse(response.body, symbolize_names: true)
  end
end
