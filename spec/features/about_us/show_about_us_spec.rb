require "rails_helper"
ABOUT_US_MESSAGE = "This is the first PDP task done for the Flatstack company.
      It's just a simple blogging website."

feature "show about us page" do
  background do
    visit about_us_path
  end

  scenario "about us page shows correctly" do
    expect(page).to have_content(ABOUT_US_MESSAGE)
    expect(page).to have_content("Github repo")
    expect(page).to have_content("Flatstack")
  end
end
