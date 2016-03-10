require "rails_helper"

feature "create comments", js:true do
  let(:user) {create :user}
  let(:article) {create :article, user: user}

  background do
    login_as user
    visit article_path(article)
    fill_in "comment-field", with: "Hello there"
    click_on "Оставить комментарий"
  end

  scenario "comments adds to the page" do
    expect(page).to have_content("Hello there")
  end

  scenario "comment-field becomes empty" do
    expect(page).to have_field("comment-field", with:"")
  end
end
