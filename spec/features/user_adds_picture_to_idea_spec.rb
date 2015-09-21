RSpec.describe Admin::CategoriesController, type: :feature do

  before(:each) do
    user = User.create(username: "Lani", password: "winnie", role: "user")
    category = Category.create(name: "Dogs I Like")

    visit login_path
    fill_in "session[username]", with: "Lani"
    fill_in "session[password]", with: "winnie"
    click_button "Login"
  end

  describe "logged in user" do
    it "can add a picture to a new idea" do
      user = User.find_by(username: "Lani")
      Picture.create(name: "Brie", url:  "https://s-media-cache-ak0.pinimg.com/originals/6a/13/24/6a1324030b861e33b1d26aaa41ea6243.jpg")

      visit new_user_idea_path(user)
      fill_in "idea[name]", with: "Golden Doodles"
      fill_in "idea[description]", with: "They are fun and don't shed."
      select "Dogs I Like", from: "idea[category_id]"
      select "Golden Doodle", from: "idea[picture_ids]"
      click_on "Create"

      within("#ideas") do
        expect(page).to have_content("Golden Doodles")
        expect(page).to have_content("Brie")
      end

    end
  end
end
