class FeedbacksController < ApplicationController
  expose(:feedback, attributes: :feedback_params)

  def new
  end

  def create
    FeedbackMailer.feedback_message(feedback).deliver_now! if feedback.valid?
    respond_with(feedback, location: root_path)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :text, :email, :subject)
  end
end
