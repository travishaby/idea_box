require "rails_helper"

RSpec.describe Admin::CategoriesController, type: :feature do

  describe "when logged in as admin" do
    it "creates a category" do
      admin = User.create(username: "Lani", password: "winnie", role: "admin")

      visit login_path
      fill_in "session[username]", with: "Lani"
      fill_in "session[password]", with: "winnie"
      click_button "Login"

      visit new_admin_category_path
      expect(page).to have_content "Please create a category"

      fill_in "category[name]", with: "Fancy Beers"
      click_button "Create"

      within "#categories" do
        expect(page).to have_content "Fancy Beers"
      end
    end

  end

end
