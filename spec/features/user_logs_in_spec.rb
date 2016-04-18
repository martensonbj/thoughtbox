require "rails_helper"

RSpec.describe "login page" do
  scenario "Registered user can login" do
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
  end

  scenario "Unauthenticated user cannot login" do
    visit login_path
    fill_in "Username", with: "test"
    fill_in "Password", with: "hello"
    within 'main' do
      click_on "Login"
    end

    expect(current_path).to eq login_path
    expect(page).to have_text("Invalid login credentials. Please try again or create a new account.")
  end
end
