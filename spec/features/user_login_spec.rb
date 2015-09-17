require 'rails_helper'

RSpec.describe UsersController, type: :feature do

  describe "user login" do
    it "logs in a registered user" do
      user = User.create(username: "Travis", password: "password")

      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: "password"
      click_on "Login"
      expect(page).to have_content("Logged in as Travis")
    end

    it "cannot log in unregistered user" do
      visit login_path
      fill_in "session[username]", with: "Lani"
      fill_in "session[password]", with: "winnie"
      click_on "Login"
      expect(page).not_to have_content("Logged in as Travis")
      expect(page).to have_content("Account not registered. Please create an account")
    end

  end
end
