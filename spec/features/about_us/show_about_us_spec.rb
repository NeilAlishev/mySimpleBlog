require "rails_helper"
ABOUT_US_MESSAGE = "This is the first PDP task done for the Flatstack company.
      It's just a simple blogging website.".freeze

GITHUB_REPO = "https://github.com/NeilAlishev/mySimpleBlog".freeze

FLATSTACK_SITE = "http://www.flatstack.com".freeze

feature "show about us page" do
  background do
    visit about_us_path
  end

  scenario "User goes to about us page" do
    expect(page).to have_content(ABOUT_US_MESSAGE)
    expect(page).to have_link("Github repo", href: GITHUB_REPO)
    expect(page).to have_link("Flatstack", href: FLATSTACK_SITE)
  end
end
