require "rails_helper"

feature "Delete article" do
  include_context "current user signed in"

  let(:article) { create(:article, user: current_user) }

  background do
    visit article_path(article)
  end

  scenario "Article gets deleted" do
    click_on "Delete"

    expect(page).to have_content("Article was successfully destroyed.")

    visit root_path

    expect(page).not_to have_content(article.title)
  end
end
