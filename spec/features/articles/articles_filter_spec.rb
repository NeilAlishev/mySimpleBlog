require "rails_helper"

feature "Articles filtered by an author" do
  include_context "current user signed in"

  let(:user) { create :user, full_name: "First User" }
  let(:another_user) { create :user, full_name: "Second User" }

  let!(:article) { create :article, user: user, title: "First user's article" }
  let!(:another_article) { create :article, user: another_user, title: "Second user's article" }

  background do
    visit root_path
  end

  scenario "User enters his username in filtering form" do
    fill_in("Full name", with: "First User")

    click_on("Find by author's name")

    expect(page).to have_content("First user's article")
    expect(page).not_to have_content("Second user's article")
  end
end
