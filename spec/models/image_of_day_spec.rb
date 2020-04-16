require 'rails_helper'

RSpec.describe 'Image of the Day', type: :model do
  it 'attributes' do
    api_data = {data: {date: "2020-04-13",
                explanation: 'Test explanation',
                title: 'Title',
                url: 'url'}}
    image = ImageOfDay.new(api_data)

    expect(image.date).to eq(api_data[:data][:date])
    expect(image.explanation).to eq(api_data[:data][:explanation])
    expect(image.title).to eq(api_data[:data][:title])
    expect(image.url).to eq(api_data[:data][:url])
  end
end