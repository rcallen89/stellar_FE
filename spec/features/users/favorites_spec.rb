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

  it 'can view a favorite' do
    visit '/favorites'
    click_link("Saturn")
    expect(current_path).to eq("/search")
    expect(page).to have_content('Saturn')
  end

  it 'can delete a favorite' do
    visit '/favorites'
    click_button("Remove Saturn from Favorites")
    expect(current_path).to eq("/favorites")
    expect(page).to have_content('Saturn has been removed from your favorites.')
  end

  it "cannot favorite same item twice" do
    expect(@user.favorites.length).to eq(1)
    visit '/favorites'
    click_link("Saturn")
    click_button("Add Saturn to Favorites")
    expect(current_path).to eq("/favorites")
    expect(page).to have_content('You have already favorited this item.')
    expect(@user.favorites.length).to eq(1)
  end

end
