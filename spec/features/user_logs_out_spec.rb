require "rails_helper"

RSpec.describe "root page" do
  scenario "User can log out" do
    user = User.create( email: "test@test.com",
                        username: "Test",
                        password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    fill_in "Confirm Password", with: user.password
    within 'main' do
      click_on "Login"
    end
    expect(current_path).to eq links_path
    expect(page).to have_text ("Welcome, #{user.username}!")

    click_on "Logout"
    expect(current_path).to eq root_path
    expect(page).to have_text ("Login")
    expect(page).to_not have_text("Welcome, #{user.username}!")
  end

end
