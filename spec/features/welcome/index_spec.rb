require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can view the welcome page', :vcr do
    visit '/'
    expect(page).to have_content('Stellar')
    expect(page).to have_button('Sign-In with Google')
  end
end
