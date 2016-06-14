require "rails_helper"

feature "Create article" do
  let(:user) { create(:user) }

  background do
    login_as user
    visit new_article_path
  end

  scenario "valid article gets created" do
    fill_in "Title", with: "My post"
    fill_in "Content", with: "Hey there!"

    click_on "Create Article"

    expect(page).to have_content("Article was successfully created.")
  end

  scenario "article without title doesn't get added" do
    fill_in "Title", with: ""
    fill_in "Content", with: "Hey there!"

    click_on "Create Article"

    expect(page).to have_content("Article could not be created.")
  end

  scenario "article without content doesn't get added" do
    fill_in "Title", with: "My post"
    fill_in "Content", with: ""

    click_on "Create Article"

    expect(page).to have_content("Article could not be created.")
  end
end
