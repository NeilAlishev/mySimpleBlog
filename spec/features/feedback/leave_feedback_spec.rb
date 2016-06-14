require "rails_helper"

feature "Leave a feedback" do
  background do
    visit root_path
    click_on "Contact us"
  end

  scenario "Feedback gets successfully submitted" do
    fill_in_feedback_form
    click_on "Send"

    expect(page).to have_content("Feedback was successfully created.")
  end

  scenario "Feedback mail gets sent" do
    fill_in_feedback_form
    click_on "Send"

    open_email(ENV["ADMIN_EMAIL"])

    expect(current_email).to have_subject("Some subject")
    expect(current_email.from).to eq(["test@example.com"])
    expect(current_email)
      .to have_content("Hi, my name is:JohnHere is my feedback:Hey there!")
  end

  private

  def fill_in_feedback_form
    fill_in "Name", with: "John"
    fill_in "Text", with: "Hey there!"
    fill_in "Subject", with: "Some subject"
    fill_in "Email", with: "test@example.com"
  end
end
