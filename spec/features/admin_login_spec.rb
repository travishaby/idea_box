require "rails_helper"

RSpec.describe UsersController, type: :feature do

  describe "as a registered admin" do
    it "logs in and displays admin status" do
      admin = User.create(username: "Lani", password: "winnie", role: "admin")

      visit login_path
      fill_in "session[username]", with: "Lani"
      fill_in "session[password]", with: "winnie"
      click_button "Login"

      visit admin_categories_path

      expect(page).to have_content "Logged in as admin Lani"
    end
  end

end
