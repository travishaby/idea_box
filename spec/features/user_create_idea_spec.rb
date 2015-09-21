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
                         category_id: category.id,
                         user_id: user.id)
      visit user_ideas_path(user, idea)

      within("#ideas") do
        expect(page).to have_content("Golden Doodles")
        click_on "Edit"
      end
      expect(current_path).to eq(edit_user_idea_path(user, idea))

      fill_in "idea[description]", with: "They are SUPER fun and don't shed."
      click_on "Submit"

      within("#ideas") do
        expect(page).to have_content("They are SUPER fun and don't shed.")
      end
    end

    it "can delete an idea" do
      user = User.find_by(username: "Lani")
      category = Category.find_by(name: "Dogs I Like")
      idea = Idea.create(name: "Golden Doodles",
                         description: "They are fun and don't shed.",
                         category_id: category.id,
                         user_id: user.id)
      visit user_ideas_path(user, idea)

      within("#ideas") do
        expect(page).to have_content("Golden Doodles")
        click_on "Delete"
      end

      expect(page).not_to have_content("Golden Doodles")

    end

  end

  describe "a logged in user" do
    it "cant see the ideas of another logged in user" do
      user = User.find_by(username: "Lani")
      category = Category.find_by(name: "Dogs I Like")
      idea = Idea.create(name: "Golden Doodles",
                         description: "They are fun and don't shed.",
                         category_id: category.id,
                         user_id: user.id)
      visit user_ideas_path(user, idea)

      within("#ideas") do
        expect(page).to have_content("Golden Doodles")
      end

      click_on "Logout"
      User.create(username: "Travis", password: "password")
      visit login_path
      fill_in "session[username]", with: "Travis"
      fill_in "session[password]", with: "password"
      click_button "Login"
      within("#ideas") do
        expect(page).not_to have_content("Golden Doodles")
      end
    end
  end
end
