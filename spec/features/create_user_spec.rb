require 'rails_helper'

RSpec.describe UsersController, type: :feature do

  describe "user creation" do
    it "creates a user and logs them in" do
      visit new_user_path
      fill_in "user[username]", with: "Travis"
      fill_in "user[password]", with: "password"
      click_on "Create Account"
      expect(page).to have_content("Logged in as Travis")
    end

    it "returns an error and rerenders new user page ith incorrect user params" do
      visit new_user_path
      fill_in "user[username]", with: "Travis"
      click_on "Create Account"
      expect(page).to_not have_content("Logged in as Travis")
      expect(page).to have_content("Invalid login, please try again.")
    end
  end

end
