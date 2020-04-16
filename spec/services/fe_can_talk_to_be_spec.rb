require 'rails_helper'

RSpec.describe 'FE App can Get API from BE', type: :service do
  it 'can receive json data from a search', :vcr do
    query = 'Jupiter'

    response = StellarService.search(query)

    expect(response).to be_instance_of(Hash)
    expect(response[:data][:name]).to eq(query)
  end
end
