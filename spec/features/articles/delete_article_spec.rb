require "rails_helper"

feature "Delete article" do
  let(:user) { create(:user) }
  let(:article) { create(:article, user: user) }

  background do
    login_as user
    visit article_path(article)
  end

  scenario "Article gets deleted" do
    expect(user.articles.count).to eq(1)

    click_on "Delete"

    expect(page).to have_content("Article was successfully destroyed.")

    expect(user.articles.count).to eq(0)
  end
end
