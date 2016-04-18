require "rails_helper"

RSpec.describe "links index page" do
  scenario "User sees a form to submit a link" do
    user = User.create( email: "test@test.com",
                        username: "Test",
                        password: "password")

    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    within 'main' do
      click_on "Login"
    end
    expect(current_path).to eq links_path
    expect(page).to have_text("Link Url")
    expect(page).to have_text("Link Title")
  end

  scenario "Unauthenticated users cannot access links page" do
    visit links_path
    expect(current_path).to eq login_path
    expect(page).to have_text ("Please log in or create an account.")
  end
end
