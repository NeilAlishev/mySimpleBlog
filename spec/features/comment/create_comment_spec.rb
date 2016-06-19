require "rails_helper"

feature "create comments", js: true do
  include_context "current user signed in"

  let(:article) { create :article, user: current_user }

  background do
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
