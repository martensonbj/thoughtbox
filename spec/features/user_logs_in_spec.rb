require "rails_helper"

RSpec.describe "login page" do
  scenario "Registered user can login" do
    user = User.create( first_name: "Blake",
                        last_name: "Griffin",
                        username: "Test",
                        password: "password")
    visit root_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    fill_in "Confirm Password", with: user.password
    click_on "Login"
    expect(current_path).to eq user_path(user.id)
    expect(page).to have_text ("Welcome, #{user.first_name}!")
  end

  scenario "Unauthenticated user cannot login" do
        visit root_path
        fill_in "Username", with: "test"
        fill_in "Password", with: "hello"
        click_on "Login"

        expect(current_path).to eq root_path
        expect(page).to have_text("Invalid login credentials. Please try again or create a new account.")
  end
end
