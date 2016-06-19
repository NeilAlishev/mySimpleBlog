require "rails_helper"

feature "Articles are sorted by recent on the home page" do
  include_context "current user signed in"

  let!(:article) { create :article, user: current_user }

  scenario "User sees article on the home page" do
    visit root_path

    expect(page.all("[data-article-id]").count).to eq(1)
  end
end
