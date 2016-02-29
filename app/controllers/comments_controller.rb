class CommentsController < ApplicationController
  expose(:comment, attributes: :comment_params)

  def create
    comment.save

    render comment
  end

  def update
    comment.save
    respond_with comment
  end

  def destroy
    comment.destroy
    render json: { status_code: "200" }
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :content)
  end
end
