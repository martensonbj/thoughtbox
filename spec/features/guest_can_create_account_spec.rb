require "rails_helper"

RSpec.describe "landing page" do
  scenario "Unauthenticated user can create account" do
        visit new_user_path
        fill_in "Email", with: "test@test.com"
        fill_in "Username", with: "test_user"
        fill_in "Password", with: "password"
        click_on "Create an Account"
        expect(page).to have_text("Welcome, test_user!")
  end

  scenario "Unauthenticated user can't duplicate email address" do
        User.create(email: "test@test.com", username: "test", password: "password")
        visit new_user_path
        fill_in "Email", with: "test@test.com"
        fill_in "Username", with: "new_user"
        fill_in "Password", with: "password"
        click_on "Create an Account"
        expect(current_path).to eq new_user_path
  end
end
