class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!
  expose(:comment, attributes: :comment_params)

  def create
    comment.save!
    render comment
  end

  def update
    comment.save!
    respond_with comment
  end

  def destroy
    comment.destroy
    render nothing: true, status: :ok
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :content).merge(user_id: current_user.id)
  end

  def authorize_user!
    authorize(comment, :manage?)
  end
end
