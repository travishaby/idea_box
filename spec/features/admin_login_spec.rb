require "rails_helper"

RSpec.describe UsersController, type: :feature do
  before(:each) do
    admin = User.create(username: "Lani", password: "winnie", role: "admin")

    visit login_path
    fill_in "session[username]", with: "Lani"
    fill_in "session[password]", with: "winnie"
    click_button "Login"
  end

  describe "as a registered admin" do
    it "logs in and displays admin status" do
      visit admin_categories_path

      expect(page).to have_content "Logged in as admin Lani"
    end

    it "can view categories list" do
      visit admin_categories_path

      expect(page).to have_content "All Categories"
    end
  end

end
