class FeedbacksController < ApplicationController
  expose(:feedback) { Feedback.new(feedback_attributes) }

  def create
    FeedbackMailer.feedback_message(feedback).deliver_now! if feedback.valid?
    respond_with(feedback, location: root_path)
  end

  private

  def feedback_attributes
    params
      .fetch(:feedback, author_attributes)
      .permit(:email, :name, :text, :subject)
  end

  def author_attributes
    return {} unless current_user

    {
      email: current_user.email,
      name: current_user.full_name
    }
  end
end
