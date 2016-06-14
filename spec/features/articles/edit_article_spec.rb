require "rails_helper"

feature "Edit article" do
  let(:user) { create(:user) }
  let(:article) { create(:article, user: user) }

  background do
    login_as user
    visit article_path(article)
  end

  scenario "Article gets edited" do
    click_on "Edit"

    fill_in("Title", with: "new title")
    fill_in("Content", with: "new content")

    click_on "Update Article"

    expect(page).to have_content("Article was successfully updated.")

    expect(user.articles.last.title).to eq "new title"
    expect(user.articles.last.content).to eq "new content"
  end
end
