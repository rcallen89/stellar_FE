require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'from any page' do
    before :each do
      @user = User.create!(uid: 13,
                          first_name: "Meghan",
                          last_name: "Stovall",
                          google_token: "abc123def456ghi789",
                          email: "meghan.stovall@gmail.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'I can search for an included solar system object', :vcr do
      visit '/'

      fill_in "search", with: "Jupiter"
      click_button 'Search'

      expect(current_path).to eq('/search')

      within ".solar-system-data" do
        expect(first('#discovered_by').text).to_not be_empty
        expect(first('#discovered_on').text).to_not be_empty
        expect(first('#gravity').text).to_not be_empty
      end
    end

    it "can search for something thats not a planet", :vcr do
      visit '/'

      fill_in "search", with: "Io"
      click_button 'Search'

      expect(current_path).to eq('/search')
      expect(page).to have_content("Planet? No")
    end

    it "user gets redirected if they enter an unknown body", :vcr do
      visit '/'

      fill_in "search", with: "asdf"
      click_button 'Search'

      expect(current_path).to eq('/')
      expect(page).to have_content("We're sorry, we could not find what you were looking for.")
    end
  end
end
