require "rails_helper"

RSpec.describe FeedbackMailer, type: :mailer do
  describe "feedback_message" do
    let(:feedback) { build(:feedback) }

    let(:mail) { described_class.feedback_message(feedback).deliver_now }

    it "renders the subject" do
      expect(mail.subject).to eq(feedback.subject)
    end

    it "renders the receiver email" do
      expect(mail.to).to eq([ENV["ADMIN_EMAIL"]])
    end

    it "renders the sender email" do
      expect(mail.from).to eq([feedback.email])
    end

    it "assigns @name" do
      expect(mail.body.encoded).to match(feedback.name)
    end

    it "assigns @text" do
      expect(mail.body.encoded).to match(feedback.text)
    end
  end
end
