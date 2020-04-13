require 'rails_helper'

RSpec.describe "Space people endpoint", :vcr do
  before :each do
    @user = User.create!(uid: 13,
                        first_name: "Meghan",
                        last_name: "Stovall",
                        google_token: "abc123def456ghi789",
                        email: "meghan.stovall@gmail.com")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "can see people and crafts currently in space" do
    visit "/"

    click_on "People in Space"
    expect(current_path).to eq("/space_people")
    expect(page).to have_content("Astronauts Currently in Space:")
    expect(page).to have_content("Space Crafts Currently in Space:")

    within ".people-in-space" do
      expect(first('#name').text).to_not be_empty
    end

    within ".crafts-in-space" do
      expect(first('#craft').text).to_not be_empty
    end
  end
end
