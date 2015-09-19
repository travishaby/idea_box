require 'rails_helper'

RSpec.describe UsersController, type: :feature do

  describe "user logs in" do
    it "as a registered user" do
      user = User.create(username: "Travis", password: "password")

      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: "password"
      click_button "Login"

      expect(page).to have_content("Logged in as Travis")
    end
  end

  describe "user cannot log in" do
    it "as an unregistered user" do
      visit login_path
      fill_in "session[username]", with: "Lani"
      fill_in "session[password]", with: "winnie"
      click_button "Login"

      expect(page).not_to have_content("Logged in as Travis")
      expect(page).to have_content("Account not registered. Please create an account")
    end
  end

  describe "logs out a logged in user" do
    before(:each) do
      user = User.create(username: "Travis", password: "password")

      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: "password"
      click_button "Login"
    end

    it "shows the login page when logged out" do
      click_on "Logout"
      expect(page).not_to have_content("Logged in as Travis")
      expect(page).to have_content("Login")
    end
  end

end
