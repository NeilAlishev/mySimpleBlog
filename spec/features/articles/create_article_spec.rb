require "rails_helper"

feature "Create article" do
  include_context "current user signed in"

  background do
    visit new_article_path
  end

  scenario "User creates article with valid params" do
    fill_in "Title", with: "My post"
    fill_in "Content", with: "Hey there!"

    click_on "Create Article"

    expect(page).to have_content("Article was successfully created.")
  end

  scenario "User creates article with invalid params" do
    fill_in "Title", with: ""
    fill_in "Content", with: "Hey there!"

    click_on "Create Article"

    expect(page).to have_content("Article could not be created.")
  end
end
