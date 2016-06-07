require "rails_helper"

feature "Leave a feedback" do
  background do
    visit root_path
    click_on "Contact us"
    fill_in "Name", with: "John"
    fill_in "Text", with: "Hey there!"
    fill_in "Subject", with: "Some subject"
    fill_in "Email", with: "test@example.com"
    click_on "Send"
  end

  scenario "Feedback gets successfully submitted" do
    expect(page).to have_content("Your feedback has been submitted")
  end
end
