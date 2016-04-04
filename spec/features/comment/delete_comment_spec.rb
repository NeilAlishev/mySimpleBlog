require "rails_helper"

feature "delete comment", js: true do
  let(:user) { create(:user) }
  let(:article) { create :article, user: user }

  background do
    login_as user
    visit article_path(article)
    fill_in "comment-field", with: "Random comment"
    click_on "Оставить комментарий"
    click_on "Удалить"
  end

  scenario "comment gets deleted" do
    expect(page).to have_no_content("Random comment")
  end
end
