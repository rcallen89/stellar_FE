require 'rails_helper'

RSpec.describe "User profile page", :vcr do
  before :each do
    @user = User.create!(uid: 13,
                        first_name: "Meghan",
                        last_name: "Stovall",
                        google_token: "abc123def456ghi789",
                        email: "meghan.stovall@gmail.com")

    @favorite = @user.favorites.create!(name: "Saturn")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'can create a favorite' do
    visit '/favorites/new'
    fill_in "Name", with: "Jupiter"
    click_on "Create Favorite"
    expect(current_path).to eq("/favorites")
    expect(page).to have_content("Jupiter has been saved to favorites")
    expect(page).to have_link("Jupiter")
    expect(page).to have_button("Remove from Favorites")
  end

  it 'can delete a favorite' do
    visit '/favorites'
    click_on "Remove from Favorites"
    expect(page).to have_content("Saturn has been removed from your favorites.")
  end

  it 'can view a favorite' do
    visit '/favorites'
    click_link("Saturn")
    expect(current_path).to eq("/favorites/#{@favorite.id}")
  end

end
