require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit the welcome page' do
    before do
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    end

    it 'I can register and login with Google Oauth', :vcr do
      stub_omniauth

      visit '/'

      expect do
        click_button 'Sign-In with Google'
      end.
      to change { User.count }.by(1)

      user = User.last

      expect(current_path).to eq('/profile')
      expect(page).to have_content("Hi, #{user.first_name}!")

    end

    it 'I can login as a returning user with Google Oauth', :vcr do
      stub_omniauth
      user = create(:user, email: "will@gmail.com",
                           first_name: "Will",
                           last_name: "Meighan")

      visit '/'

      expect do
        click_button 'Sign-In with Google'
      end.
      to change { User.count }.by(0)

      expect(current_path).to eq('/profile')
      expect(page).to have_content("Hi, #{user.first_name}")

      expect(User.count).to eq(1)
    end
  end

end
