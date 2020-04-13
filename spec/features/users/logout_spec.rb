require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'after I have logged in' do
    before do
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    end

    it 'I can logout', :vcr do
      visit '/'

      expect(page).to_not have_link('Log Out')

      click_button 'Sign-In with Google'

      user = User.last

      expect(page).to have_content("Hi, #{user.first_name}")
      click_link('Log Out')

      # expect(page).to have_content('You have been logged out.')
      expect(current_path).to eq('/')

      expect(page).to_not have_content("Hi, #{user.first_name}")
    end
  end
end
