RSpec.describe Admin::CategoriesController, type: :feature do

  before(:each) do
    user = User.create(username: "Lani", password: "winnie", role: "user")

    visit login_path
    fill_in "session[username]", with: "Lani"
    fill_in "session[password]", with: "winnie"
    click_button "Login"
  end

  describe "a logged in user" do
    it "can create an idea" do
      expect(page).to have_content("Your Ideas")

      within "#create_idea" do
        click_on "Create"
      end

      expect(current_path).to be.new_idea_path

      fill_in "idea[name]", with: "Golden Doodles"
      fill_in "idea[description]", with: "They are fun and don't shed."
      fill_in "idea[category]", with: "Dogs I Like"
      click_on "Create"

      within("#ideas") do
        expect(page).to have_content("Golden Doodles")
      end
    end
  end

end
