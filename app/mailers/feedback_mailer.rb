class FeedbackMailer < ApplicationMailer
  layout "feedback_mailer/feedback_message"

  def feedback_message(feedback)
    @feedback = feedback
    mail(to: "nailalishev@yahoo.com", subject: "Feedback",
         from: "blogProject@example.com")
  end
end

