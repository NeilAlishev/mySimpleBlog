require "rails_helper"

feature "Edit article" do
  include_context "current user signed in"

  let(:article) { create(:article, user: current_user) }

  background do
    visit edit_article_path(article)
  end

  scenario "User edits the article" do
    fill_in("Title", with: "new title")
    fill_in("Content", with: "new content")

    click_on "Update Article"

    expect(page).to have_content("Article was successfully updated.")

    expect(current_user.articles.last.title).to eq "new title"
    expect(current_user.articles.last.content).to eq "new content"
  end
end
