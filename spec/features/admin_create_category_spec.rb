require "rails_helper"

RSpec.describe Admin::CategoriesController, type: :feature do

  before(:each) do
    admin = User.create(username: "Lani", password: "winnie", role: "admin")

    visit login_path
    fill_in "session[username]", with: "Lani"
    fill_in "session[password]", with: "winnie"
    click_button "Login"
  end

  describe "when logged in as admin" do
    it "creates a category" do
      visit new_admin_category_path
      expect(page).to have_content "Please create a category"

      fill_in "category[name]", with: "Fancy Beers"
      click_button "Create"

      within "#categories" do
        expect(page).to have_content "Fancy Beers"
      end
    end

    it "edits a category" do
      visit new_admin_category_path
      fill_in "category[name]", with: "Fancy Beers"
      click_button "Create"
      visit admin_categories_path

      click_link "Edit"

      fill_in "category[name]", with: "Fancy Cheeses"
      click_button "Submit"

      within "#category" do
        expect(page).not_to have_content "Fancy Beers"
        expect(page).to have_content "Fancy Cheeses"
      end
    end

    it "deletes a category" do
      visit new_admin_category_path
      fill_in "category[name]", with: "Fancy Beers"
      click_button "Create"
      visit admin_categories_path

      within("#category_3") do
        click_link "Delete"
      end
      visit admin_categories_path

      within "#categories" do
        expect(page).not_to have_content "Fancy Beers"
      end
    end
  end

end
