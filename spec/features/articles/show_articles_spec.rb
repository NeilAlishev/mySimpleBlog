require "rails_helper"

feature "Articles are sorted by recent on the home page" do
  let(:user) { create(:user) }

  background do
    login_as user
  end

  scenario "Created article shows up" do
    visit root_path

    expect(page.all("[data-article-id]").count).to eq(0)

    create_article

    visit root_path

    expect(page.all("[data-article-id]").count).to eq(1)
  end

  private

  def create_article
    visit new_article_path

    fill_in "Title", with: "My post"
    fill_in "Content", with: "Hey there!"

    click_on "Create Article"
  end
end
