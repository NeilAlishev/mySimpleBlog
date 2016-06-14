require "rails_helper"

feature "create comments", js: true do
  let(:user) { create :user }
  let(:article) { create :article, user: user }

  background do
    login_as user
    visit article_path(article)
  end

  scenario "valid comment is created successfully" do
    fill_in "comment-field", with: "Hello there"
    click_on "Leave a comment"

    expect(page).to have_content("Hello there")
    expect(page).to have_field("comment-field", with: "")

    visit article_path(article)
    expect(page).to have_content("Hello there")
  end
end
