class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i(update destroy)
  expose(:comment, attributes: :comment_attributes)

  def create
    comment.user = current_user
    comment.save
    render comment.decorate
  end

  def destroy
    comment.destroy
    render nothing: true, status: :ok
  end

  private

  def comment_attributes
    params.require(:comment).permit(:article_id, :content)
  end

  def authorize_user!
    authorize(comment, :manage?)
  end
end
