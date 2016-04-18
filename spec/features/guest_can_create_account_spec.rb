require "rails_helper"

RSpec.describe "landing page" do
  scenario "Unauthenticated user can create account" do
        visit new_user_path
        fill_in "First Name", with: "Blake"
        fill_in "Last Name", with: "Griffin"
        fill_in "Username", with: "blake_user"
        fill_in "Password", with: "password"
        click_on "Create an Account"
        expect(page).to have_text("Welcome, Blake!")
  end
end
