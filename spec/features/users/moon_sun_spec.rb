require 'rails_helper'

RSpec.describe "Moon and Sun endpoint", :vcr do
  before :each do
    @user = User.create!(uid: 13,
                        first_name: "Meghan",
                        last_name: "Stovall",
                        google_token: "abc123def456ghi789",
                        email: "meghan.stovall@gmail.com")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "can enter in a location and get moon and sun info" do
    visit "/"

    click_on "Sun & Moon"
    expect(current_path).to eq('/sun_and_moon_search')

    fill_in "location", with: "Denver, CO"
    click_on "Enter"
    expect(current_path).to eq('/sun_and_moon')

    within ".sun-moon-data" do
      expect(first('#sunrise').text).to_not be_empty
      expect(first('#sunset').text).to_not be_empty
      expect(first('#moonrise').text).to_not be_empty
      expect(first('#moonset').text).to_not be_empty
      expect(first('#moon_phase').text).to_not be_empty
      expect(first('#moon_illumination').text).to_not be_empty
    end
  end
end
