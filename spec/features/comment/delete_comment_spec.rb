require "rails_helper"

feature "delete comment", js: true do
  include_context "current user signed in"

  let(:article) { create :article, user: current_user }
  let!(:comment) do
    create(
      :comment,
      content: "Random comment",
      user: current_user,
      article: article
    )
  end

  background do
    visit article_path(article)
  end

  scenario "comment gets deleted" do
    click_on "Delete comment"

    expect(page).to have_no_content("Random comment")
  end
end
