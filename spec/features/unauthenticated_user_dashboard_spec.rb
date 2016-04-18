require "rails_helper"

RSpec.describe "dashboard page" do
  scenario "Unathenticated user can choose to log in" do
    visit root_path
    expect(page).to have_text ("Login")
    expect(page).to have_text ("Sign Up")
    expect(page).to_not have_text ("Logout")
  end
end
