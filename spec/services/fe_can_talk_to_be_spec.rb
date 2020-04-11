require 'rails_helper'

RSpec.describe 'FE App can Get API from BE', type: :service do
  it 'can receive json data from a search', :vcr do
    query = 'Jupiter'

    be_service = StellarService.new
    response = be_service.search('jupiter')

    expect(response).to be_instance_of(Hash)
    expect(response[:name]).to eq(query)
  end
end