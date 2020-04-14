require 'rails_helper'

RSpec.describe 'Navbar Links', type: :feature do
  it 'a visitor can view the welcome page with only sign in and Stellar in nav bar', :vcr do
    visit '/'
    expect(page).to have_content('Stellar')
    expect(page).to have_button('Sign-In with Google')
  end

  it 'As a user can see links to s/m, search bar, profile, and logout options', :vcr do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    expect(page).to have_content('Stellar')
    expect(page).to have_content('Sun & Moon')
    expect(page).to have_content('Profile')
    expect(page).to have_content('Log Out')
  end

  it 'visitor cannot navigate to profile' do
    visit '/profile'
    expect(page.status_code).to eq(404)
  end

end
