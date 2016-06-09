class FeedbackMailer < ApplicationMailer
  def feedback_message(feedback)
    @feedback = feedback
    mail(subject: @feedback.subject,
         from: @feedback.email)
  end
end
