RSpec.describe Admin::CategoriesController, type: :feature do

  before(:each) do
    user = User.create(username: "Lani", password: "winnie", role: "user")
    category = Category.create(name: "Dogs I Like")

    visit login_path
    fill_in "session[username]", with: "Lani"
    fill_in "session[password]", with: "winnie"
    click_button "Login"
  end

  describe "a logged in user" do
    it "can create an idea" do
      user = User.find_by(username: "Lani")
      visit user_ideas_path(user)
      expect(page).to have_content("Your Ideas")

      within "#create_idea" do
        click_on "Create"
      end

      expect(current_path).to eq(new_user_idea_path(user))

      fill_in "idea[name]", with: "Golden Doodles"
      fill_in "idea[description]", with: "They are fun and don't shed."
      select "Dogs I Like", from: "idea[category_id]"
      click_on "Create"

      within("#ideas") do
        expect(page).to have_content("Golden Doodles")
      end
    end

    it "can edit an idea" do
      user = User.find_by(username: "Lani")
      category = Category.find_by(name: "Dogs I Like")
      idea = Idea.create(name: "Golden Doodles",
                         description: "They are fun and don't shed.",
                         category_id: category.id)
      within("#ideas") do
        expect(page).to have_content("Golden Doodles")
        click_link "Edit"
      end

      fill_in "idea[description]", with: "They are fun and don't shed."

      
    end
  end

end
