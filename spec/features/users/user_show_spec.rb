require 'rails_helper'

RSpec.describe "User profile page", :vcr do
  before :each do
    @user = User.create!(uid: 13,
                        first_name: "Meghan",
                        last_name: "Stovall",
                        google_token: "abc123def456ghi789",
                        email: "meghan.stovall@gmail.com")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/profile"
  end

  it "can see user info on user show page" do
    expect(page).to have_content("Hi, #{@user.first_name}")
    expect(page).to have_content("Name: #{@user.first_name} #{@user.last_name}")
    expect(page).to have_content("Joined: #{@user.created_at}")
    expect(page).to have_button("View Favorites")
  end

  it "can click link to view favorites" do
    click_button "View Favorites"
    expect(current_path).to eq("/favorites")
  end

  it "can edit user information" do
    click_link "Edit Info"
    expect(current_path).to eq("/profile/edit")
    fill_in "first_name", with: ""
    click_on "Update Info"
    expect(page).to have_content("First name can't be blank")
    fill_in "first_name", with: "Bob"
    click_on "Update Info"
    expect(current_path).to eq("/profile")
    expect(page).to have_content("Hi, Bob!")
    expect(page).to_not have_content("Hi, Will!")
  end

end
